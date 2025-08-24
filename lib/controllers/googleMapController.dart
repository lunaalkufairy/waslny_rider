import 'package:flutter/painting.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

class Googlemapcontroller extends GetxController {
  GoogleMapController? mapController;
  Rxn<LatLng> currentLocation = Rxn<LatLng>();
  BitmapDescriptor customIcon = BitmapDescriptor.defaultMarker;

  // ماركر واحد بس
  final RxSet<Marker> markers = <Marker>{}.obs;

  void customMarker() {
    BitmapDescriptor.asset(
      ImageConfiguration(size: const Size(100, 100)),
      "assets/icons/CurrentLocationMarker.png",
    ).then((icon) {
      customIcon = icon;

      // أنشئ الماركر مرّة وحدة
      if (currentLocation.value != null) {
        markers.add(
          Marker(
            markerId: const MarkerId("currentLocation"),
            position: currentLocation.value!,
            icon: customIcon,
          ),
        );
      }
      update();
    });
  }

  final String mapStyle = '''[
    {
      "featureType": "all",
      "elementType": "all",
      "stylers": [
        { "saturation": 36 },
        { "color": "#000000" },
        { "lightness": 40 }
      ]
    },
    {
      "featureType": "all",
      "elementType": "labels.text.stroke",
      "stylers": [
        { "visibility": "on" },
        { "color": "#000000" },
        { "lightness": 16 }
      ]
    },
    {
      "featureType": "all",
      "elementType": "labels.icon",
      "stylers": [
        { "visibility": "off" }
      ]
    },
    {
      "featureType": "administrative",
      "elementType": "geometry.fill",
      "stylers": [
        { "color": "#000000" },
        { "lightness": 20 }
      ]
    },
    {
      "featureType": "administrative",
      "elementType": "geometry.stroke",
      "stylers": [
        { "color": "#000000" },
        { "lightness": 17 },
        { "weight": 1.2 }
      ]
    },
    {
      "featureType": "landscape",
      "elementType": "geometry",
      "stylers": [
        { "color": "#000000" },
        { "lightness": 20 }
      ]
    },
    {
      "featureType": "poi",
      "elementType": "geometry",
      "stylers": [
        { "color": "#000000" },
        { "lightness": 21 }
      ]
    },
    {
      "featureType": "road.highway",
      "elementType": "geometry.fill",
      "stylers": [
        { "color": "#000000" },
        { "lightness": 17 }
      ]
    },
    {
      "featureType": "road.highway",
      "elementType": "geometry.stroke",
      "stylers": [
        { "color": "#000000" },
        { "lightness": 29 },
        { "weight": 0.2 }
      ]
    },
    {
      "featureType": "road.arterial",
      "elementType": "geometry",
      "stylers": [
        { "color": "#000000" },
        { "lightness": 18 }
      ]
    },
    {
      "featureType": "road.local",
      "elementType": "geometry",
      "stylers": [
        { "color": "#000000" },
        { "lightness": 16 }
      ]
    },
    {
      "featureType": "transit",
      "elementType": "geometry",
      "stylers": [
        { "color": "#000000" },
        { "lightness": 19 }
      ]
    },
    {
      "featureType": "water",
      "elementType": "geometry",
      "stylers": [
        { "color": "#000000" },
        { "lightness": 17 }
      ]
    }
  ]
''';

  @override
  void onInit() {
    super.onInit();
    customMarker();
    trackLocation();
  }

  Future<void> trackLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) return;

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.deniedForever ||
          permission == LocationPermission.denied) return;
    }

    Geolocator.getPositionStream(
      locationSettings: const LocationSettings(
        accuracy: LocationAccuracy.high,
        distanceFilter: 5,
      ),
    ).listen((Position position) {
      final newLocation = LatLng(position.latitude, position.longitude);
      currentLocation.value = newLocation;

      // عدّل موقع الماركر بدل ما تعمله جديد
      markers.value = {
        Marker(
          markerId: const MarkerId("currentLocation"),
          position: newLocation,
          icon: customIcon,
        ),
      };

      // حرّك الكاميرا مع الموقع
      mapController?.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: newLocation,
            zoom: 17,
            tilt: 45,
            bearing: 0,
          ),
        ),
      );
    });
  }

  void onMapCreated(GoogleMapController controller) {
    mapController = controller;
    mapController!.setMapStyle(mapStyle);
  }
}
