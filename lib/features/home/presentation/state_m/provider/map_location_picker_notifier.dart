import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../../core/common/app_config.dart';
import '../../../../../core/common/custom_modules/screen_notifier.dart';
import '../../../../../core/common/utils/location_access_utils.dart';
import '../../../../../core/constants/app/app_constants.dart';
import '../../../../../core/navigation/nav.dart';
import '../../../domain/utils/location_label_utils.dart';
import '../../screen/map_location_picker_screen.dart';

class MapLocationPickerNotifier extends ScreenNotifier<MapLocationPickerScreenParam> {
  MapLocationPickerNotifier(super.param) {
    _center = param.initialPosition ?? AppConstants.API_INITIAL_MAP_LOCATION;
  }

  static const _logTag = 'MapLocationPicker';

  GoogleMapController? _mapController;
  late LatLng _center;
  bool _isSubmitting = false;
  bool _mapReady = false;
  bool _locationGranted = false;
  bool _isLocating = false;
  bool _accessStarted = false;
  Brightness? _appliedMapStyleBrightness;
  String? _mapStyle;
  bool _isCameraAnimating = false;
  LatLng? _lastCameraTarget;

  LatLng get center => _center;
  bool get isSubmitting => _isSubmitting;
  bool get mapReady => _mapReady;
  bool get locationGranted => _locationGranted;
  bool get isLocating => _isLocating;
  bool get hasInitialPosition => param.initialPosition != null;
  String? get mapStyle => _mapStyle;

  CameraPosition get initialCameraPosition => CameraPosition(
        target: _center,
        zoom: AppConstants.DEFAULT_MAP_ZOOM,
      );

  void _log(String message) {
    log(message, name: _logTag);
  }

  Future<void> ensureLocationAccess() async {
    if (_accessStarted) return;
    _accessStarted = true;

    _log('ensureLocationAccess start');

    final ready = await LocationAccessUtils.ensureLocationAccess();
    _locationGranted = ready;
    notifyListeners();

    _log(
      'ensureLocationAccess ready=$ready '
      'mapControllerReady=${_mapController != null}',
    );

    if (ready && !hasInitialPosition) {
      await goToCurrentLocation(
        animate: _mapController != null,
        source: 'ensureLocationAccess',
        skipAccessCheck: true,
      );
    }
  }

  Future<void> onMapCreated(
    GoogleMapController controller, {
    required Brightness brightness,
  }) async {
    _log('onMapCreated map controller ready');
    _mapController = controller;
    _mapReady = true;
    notifyListeners();

    await applyMapStyle(brightness);

    if (_locationGranted && !hasInitialPosition) {
      await goToCurrentLocation(
        animate: false,
        source: 'onMapCreated',
        skipAccessCheck: true,
      );
    } else {
      _log(
        'onMapCreated skip auto-locate '
        'locationGranted=$_locationGranted '
        'hasInitialPosition=$hasInitialPosition',
      );
    }
  }

  Future<void> applyMapStyle(Brightness brightness) async {
    if (_appliedMapStyleBrightness == brightness) return;

    try {
      _mapStyle = await AppConfig().resolveGoogleMapStyle(brightness);
      _appliedMapStyleBrightness = brightness;
      notifyListeners();
      _log('applyMapStyle brightness=$brightness');
    } catch (e, stackTrace) {
      _log('applyMapStyle failed: $e\n$stackTrace');
    }
  }

  void onCameraMove(LatLng target) {
    if (_isCameraAnimating) return;
    _lastCameraTarget = target;
  }

  void onCameraIdle() {
    if (_isCameraAnimating) return;
    final target = _lastCameraTarget;
    if (target == null) return;
    _center = target;
  }

  Future<void> goToCurrentLocation({
    bool animate = true,
    String source = 'unknown',
    bool skipAccessCheck = false,
  }) async {
    _log(
      'goToCurrentLocation start source=$source animate=$animate '
      'locationGranted=$_locationGranted isLocating=$_isLocating '
      'mapControllerReady=${_mapController != null}',
    );

    if (_isLocating) {
      _log('goToCurrentLocation skip — already locating');
      return;
    }

    _isLocating = true;
    notifyListeners();

    try {
      if (!skipAccessCheck) {
        final ready = await LocationAccessUtils.ensureLocationAccess();
        _locationGranted = ready;
        notifyListeners();
        if (!ready) {
          _log('goToCurrentLocation abort — location access not ready');
          return;
        }
      }

      _log('goToCurrentLocation requesting getCurrentPosition…');
      final position = await Geolocator.getCurrentPosition(
        locationSettings: const LocationSettings(
          accuracy: LocationAccuracy.best,
        ),
      );

      _log(
        'goToCurrentLocation position=(${position.latitude},${position.longitude}) '
        'accuracy=${position.accuracy}m',
      );

      final target = LatLng(position.latitude, position.longitude);
      _center = target;
      _lastCameraTarget = target;
      notifyListeners();

      _log(
        'goToCurrentLocation center updated to (${target.latitude},${target.longitude})',
      );

      final controller = _mapController;
      if (controller == null) {
        _log(
          'goToCurrentLocation center stored — map controller not ready yet, '
          'camera move deferred until onMapCreated',
        );
        return;
      }

      final update = CameraUpdate.newLatLngZoom(
        target,
        AppConstants.DEFAULT_MAP_ZOOM,
      );

      _log(
        'goToCurrentLocation moving camera animate=$animate '
        'zoom=${AppConstants.DEFAULT_MAP_ZOOM}',
      );

      _isCameraAnimating = true;
      try {
        if (animate) {
          await controller.animateCamera(update);
        } else {
          await controller.moveCamera(update);
        }
      } finally {
        _isCameraAnimating = false;
      }

      _center = target;
      _lastCameraTarget = target;

      _log('goToCurrentLocation camera move completed');
    } catch (e, stackTrace) {
      _log('goToCurrentLocation failed: $e\n$stackTrace');
    } finally {
      _isLocating = false;
      notifyListeners();
      _log('goToCurrentLocation finished isLocating=false');
    }
  }

  Future<void> confirmLocation(BuildContext context) async {
    if (_isSubmitting || _isLocating) return;
    _isSubmitting = true;
    notifyListeners();

    try {
      _log(
        'confirmLocation geocoding center=(${_center.latitude},${_center.longitude})',
      );

      final resolved = await LocationLabelUtils.resolveMapPlace(
        latitude: _center.latitude,
        longitude: _center.longitude,
      );

      if (!context.mounted) return;

      Nav.pop(
        context,
        MapPickResult(
          latitude: _center.latitude,
          longitude: _center.longitude,
          city: resolved?.city,
          country: resolved?.country,
          displayLabel: resolved?.displayLabel,
        ),
      );
    } finally {
      _isSubmitting = false;
      if (context.mounted) notifyListeners();
    }
  }

  @override
  void closeNotifier() {
    _mapController = null;
    _appliedMapStyleBrightness = null;
    dispose();
  }
}
