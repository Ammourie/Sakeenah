/// JSON styles for [GoogleMapController.setMapStyle].
///
/// Light mode uses the platform default map (null style).
abstract final class GoogleMapStyles {
  GoogleMapStyles._();

  /// Clears custom styling so the standard map tiles are shown.
  static const String? light = null;

  /// Night-style map aligned with Sakeenah dark surfaces (#121F1A / #1E3229).
  static const String dark = '''
[
  {"elementType": "geometry", "stylers": [{"color": "#121f1a"}]},
  {"elementType": "labels.text.fill", "stylers": [{"color": "#a8b5ae"}]},
  {"elementType": "labels.text.stroke", "stylers": [{"color": "#121f1a"}]},
  {
    "featureType": "administrative",
    "elementType": "geometry.stroke",
    "stylers": [{"color": "#2a3a33"}]
  },
  {
    "featureType": "administrative.land_parcel",
    "elementType": "labels.text.fill",
    "stylers": [{"color": "#7a8780"}]
  },
  {
    "featureType": "poi",
    "elementType": "labels.text.fill",
    "stylers": [{"color": "#7a8780"}]
  },
  {
    "featureType": "poi.park",
    "elementType": "geometry",
    "stylers": [{"color": "#1a4d3c"}]
  },
  {
    "featureType": "road",
    "elementType": "geometry",
    "stylers": [{"color": "#1e3229"}]
  },
  {
    "featureType": "road",
    "elementType": "geometry.stroke",
    "stylers": [{"color": "#2a3a33"}]
  },
  {
    "featureType": "road.highway",
    "elementType": "geometry",
    "stylers": [{"color": "#243830"}]
  },
  {
    "featureType": "road.highway",
    "elementType": "geometry.stroke",
    "stylers": [{"color": "#121f1a"}]
  },
  {
    "featureType": "transit",
    "elementType": "geometry",
    "stylers": [{"color": "#1e3229"}]
  },
  {
    "featureType": "water",
    "elementType": "geometry",
    "stylers": [{"color": "#080f0c"}]
  },
  {
    "featureType": "water",
    "elementType": "labels.text.fill",
    "stylers": [{"color": "#3d5248"}]
  }
]
''';
}
