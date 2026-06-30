import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

class FactoryMapWidget extends StatefulWidget {
  final bool isInteractive;
  final bool isFullScreen;
  final VoidCallback? onTap;

  const FactoryMapWidget({
    super.key,
    this.isInteractive = false,
    this.isFullScreen = false,
    this.onTap,
  });

  @override
  State<FactoryMapWidget> createState() => _FactoryMapWidgetState();
}

class _FactoryMapWidgetState extends State<FactoryMapWidget> {
  // New Factory Location (Beni Suef Area)
  final LatLng _initialPosition = const LatLng(29.051304, 31.159940);
  final Set<Marker> _markers = {};
  final Set<Polygon> _polygons = {};
  GoogleMapController? _controller;

  // Custom Map Style (Silver/Clean)
  final String _mapStyle = '''
[
  {
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#f5f5f5"
      }
    ]
  },
  {
    "elementType": "labels.icon",
    "stylers": [
      {
        "visibility": "off"
      }
    ]
  },
  {
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#616161"
      }
    ]
  },
  {
    "elementType": "labels.text.stroke",
    "stylers": [
      {
        "color": "#f5f5f5"
      }
    ]
  },
  {
    "featureType": "administrative.land_parcel",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#bdbdbd"
      }
    ]
  },
  {
    "featureType": "poi",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#eeeeee"
      }
    ]
  },
  {
    "featureType": "poi",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#757575"
      }
    ]
  },
  {
    "featureType": "poi.park",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#e5e5e5"
      }
    ]
  },
  {
    "featureType": "poi.park",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#9e9e9e"
      }
    ]
  },
  {
    "featureType": "road",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#ffffff"
      }
    ]
  },
  {
    "featureType": "road.arterial",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#757575"
      }
    ]
  },
  {
    "featureType": "road.highway",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#dadada"
      }
    ]
  },
  {
    "featureType": "road.highway",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#616161"
      }
    ]
  },
  {
    "featureType": "road.local",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#9e9e9e"
      }
    ]
  },
  {
    "featureType": "transit.line",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#e5e5e5"
      }
    ]
  },
  {
    "featureType": "transit.station",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#eeeeee"
      }
    ]
  },
  {
    "featureType": "water",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#c9c9c9"
      }
    ]
  },
  {
    "featureType": "water",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#9e9e9e"
      }
    ]
  }
]
''';

  @override
  void initState() {
    super.initState();
    _loadRestrictedZone();
  }

  void _loadRestrictedZone() {
    // Restricted Zone - Red polygon defined by 4 corner points (clockwise)
    _polygons.add(
      Polygon(
        polygonId: const PolygonId('restricted_zone'),
        points: const [
          LatLng(29.0519, 31.1587), // Top-Left
          LatLng(29.0519, 31.1607), // Top-Right
          LatLng(29.0504, 31.1607), // Bottom-Right
          LatLng(29.0504, 31.1587), // Bottom-Left
        ],
        strokeColor: Colors.red,
        strokeWidth: 3,
        fillColor: const Color.fromRGBO(244, 67, 54, 0.15),
      ),
    );

    setState(() {});
  }

  Future<void> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Location services are disabled.')),
        );
      }
      return;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Location permissions are denied')),
          );
        }
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'Location permissions are permanently denied, we cannot request permissions.',
            ),
          ),
        );
      }
      return;
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    Position position = await Geolocator.getCurrentPosition();

    _controller?.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: LatLng(position.latitude, position.longitude),
          zoom: 18,
        ),
      ),
    );

    setState(() {
      _markers.add(
        Marker(
          markerId: const MarkerId('current_location'),
          position: LatLng(position.latitude, position.longitude),
          icon: BitmapDescriptor.defaultMarkerWithHue(
            BitmapDescriptor.hueAzure,
          ),
          infoWindow: const InfoWindow(title: 'You are here'),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    // If not interactive, wrap in gesture detector to capture tap
    Widget mapContent = GoogleMap(
      initialCameraPosition: CameraPosition(
        target: _initialPosition,
        zoom: widget.isInteractive ? 17 : 16,
        tilt: widget.isInteractive ? 45 : 30,
        bearing: 30,
      ),
      markers: _markers,
      polygons: _polygons,
      myLocationEnabled: false,
      zoomControlsEnabled: false,
      buildingsEnabled: true,
      scrollGesturesEnabled: widget.isInteractive,
      zoomGesturesEnabled: widget.isInteractive,
      tiltGesturesEnabled: widget.isInteractive,
      rotateGesturesEnabled: widget.isInteractive,
      mapType: MapType.hybrid,
      style: widget.isInteractive ? null : _mapStyle,
      onMapCreated: (GoogleMapController controller) {
        _controller = controller;
      },
      onTap: widget.isInteractive ? null : (_) => widget.onTap?.call(),
    );

    // Provide a Hero flight wrapper if needed, but standard Hero works on the container
    final double radius = widget.isFullScreen ? 0 : 16;

    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFFF5F7FA),
        borderRadius: BorderRadius.circular(radius),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(radius),
        child: Stack(
          children: [
            mapContent,
            if (!widget.isInteractive)
              Positioned.fill(
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: widget.onTap,
                    splashColor: const Color.fromRGBO(0, 0, 0, 0.1),
                    highlightColor: const Color.fromRGBO(0, 0, 0, 0.05),
                  ),
                ),
              ),
            // My Location Button (Only interactive mode)
            if (widget.isInteractive)
              Positioned(
                bottom: 16,
                right: 16,
                child: FloatingActionButton(
                  onPressed: _determinePosition,
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black87,
                  tooltip: 'My Location',
                  child: const Icon(Icons.my_location),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class FactoryMapFullScreen extends StatelessWidget {
  const FactoryMapFullScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const FactoryMapWidget(isInteractive: true, isFullScreen: true),
          // Back Button
          Positioned(
            top: MediaQuery.of(context).padding.top + 16,
            left: 16,
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.black),
                onPressed: () => Navigator.pop(context),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
