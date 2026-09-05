import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

import '../../../../core/ui/screens/base_screen.dart';
import '../state_m/provider/map_location_picker_notifier.dart';
import 'map_location_picker_screen_content.dart';

class MapLocationPickerScreenParam {
  const MapLocationPickerScreenParam({this.initialPosition});

  final LatLng? initialPosition;
}

class MapPickResult {
  const MapPickResult({
    required this.latitude,
    required this.longitude,
  });

  final double latitude;
  final double longitude;
}

class MapLocationPickerScreen extends BaseScreen<MapLocationPickerScreenParam> {
  static const routeName = '/MapLocationPickerScreen';

  const MapLocationPickerScreen({
    Key? key,
    required MapLocationPickerScreenParam param,
  }) : super(key: key, param: param);

  @override
  State<MapLocationPickerScreen> createState() =>
      _MapLocationPickerScreenState();
}

class _MapLocationPickerScreenState extends State<MapLocationPickerScreen> {
  late final MapLocationPickerNotifier provider;

  @override
  void initState() {
    super.initState();
    provider = MapLocationPickerNotifier(widget.param);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    provider.ensureLocationAccess();
  }

  @override
  void dispose() {
    provider.closeNotifier();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MapLocationPickerNotifier>.value(
      value: provider,
      child: const MapLocationPickerScreenContent(),
    );
  }
}
