import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class ChooseMapLocationController extends GetxController {
  late GoogleMapController mapController;

  List<Marker> selectedMarkers = [];

  double latitude = 0.0;
  double longitude = 0.0;

  String fullAddress = "";
  String street = "";
  String suburb = "";
  String city = "";
  String state = "";
  String country = "";

  bool isLoading = false;

  BitmapDescriptor customIcon = BitmapDescriptor.defaultMarker;

  String mapStyle = '''
[
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
    loadCustomMarker("assets/icons/ic_dest.png");
    goToUserLocation();
  }

  Future<void> loadCustomMarker(String assetPath) async {
    customIcon = await BitmapDescriptor.fromAssetImage(
      const ImageConfiguration(size: Size(100, 100)),
      assetPath,
    );
    print("✅ تم تحميل الماركر: $assetPath");
    update();
  }

  void onMapCreated(GoogleMapController controller) {
    mapController = controller;
    if (mapStyle.isNotEmpty) {
      mapController.setMapStyle(mapStyle);
    }
  }

  // الانتقال لموقع المستخدم مباشرة
  Future<void> goToUserLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) return;

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever) return;
    }

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    latitude = position.latitude;
    longitude = position.longitude;

    mapController.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: LatLng(latitude, longitude),
          zoom: 15, // الزوم المطلوب
        ),
      ),
    );

    update();
  }

  void onMapTapped(LatLng position) async {
    latitude = position.latitude;
    longitude = position.longitude;

    selectedMarkers.clear();
    selectedMarkers.add(
      Marker(
        markerId: const MarkerId("selected"),
        position: position,
        icon: customIcon,
        infoWindow: const InfoWindow(title: "الموقع المختار"),
      ),
    );

    print("📍 تم الضغط على الخريطة!");
    print("Latitude: $latitude");
    print("Longitude: $longitude");

    update();

    await getAddressFromLatLng(latitude, longitude);
  }

  Future<void> getAddressFromLatLng(double lat, double lng) async {
    try {
      isLoading = true;
      update();

      final url = Uri.parse(
          "https://nominatim.openstreetmap.org/reverse?format=json&lat=$lat&lon=$lng&zoom=18&addressdetails=1");

      final response =
          await http.get(url, headers: {"User-Agent": "waslny_rider_app/1.0"});

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        fullAddress = data["display_name"] ?? "موقع غير معروف";

        var address = data["address"] ?? {};
        street = address["road"] ?? "";
        suburb = address["suburb"] ?? "";
        city = address["city"] ?? address["town"] ?? address["village"] ?? "";
        state = address["state"] ?? "";
        country = address["country"] ?? "";

        print("📍 العنوان الكامل: $fullAddress");
        print("🛣️ شارع: $street");
        print("🏘️ حي: $suburb");
        print("🏙️ مدينة: $city");
        print("🌍 محافظة: $state");
        print("🇺🇳 دولة: $country");
        print("📌 Lat: $latitude, Lng: $longitude");
      } else {
        fullAddress = "خطأ في جلب العنوان";
        print("❌ خطأ في جلب العنوان، status: ${response.statusCode}");
      }
    } catch (e) {
      fullAddress = "خطأ: $e";
      print("❌ استثناء أثناء جلب العنوان: $e");
    } finally {
      isLoading = false;
      update();
    }
  }
}
