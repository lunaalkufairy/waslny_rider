import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:waslny_rider/constants.dart';

class RouteMapController extends GetxController {
  late GoogleMapController mapController;

  List<LatLng> points = [];
  List<Marker> markers = [];
  List<Polyline> polylines = [];

  /// كستوم ستايل للخريطة
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
  ]''';

  /// إعداد النقاط مع أيقونات مخصصة لكل نقطة
  Future<void> setPointsWithIcons(
      List<LatLng> newPoints, List<String> iconPaths) async {
    points = newPoints;
    markers = [];

    for (int i = 0; i < points.length; i++) {
      BitmapDescriptor icon = await BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(size: Size(48, 48)),
        iconPaths[i],
      );

      markers.add(
        Marker(
          markerId: MarkerId("marker_$i"),
          position: points[i],
          icon: icon,
          infoWindow: InfoWindow(
            title: "نقطة ${i + 1}",
            snippet:
                "${points[i].latitude.toStringAsFixed(5)}, ${points[i].longitude.toStringAsFixed(5)}",
          ),
        ),
      );
    }

    if (points.length >= 2) {
      await _drawRouteOSRM(points);
    }

    update();
    _moveCameraToFitPoints();
  }

  void onMapCreated(GoogleMapController controller) {
    mapController = controller;
    mapController.setMapStyle(mapStyle); // تطبيق الكستوم ستايل
  }

  void _moveCameraToFitPoints() {
    if (points.isEmpty) return;

    double minLat = points.first.latitude;
    double maxLat = points.first.latitude;
    double minLng = points.first.longitude;
    double maxLng = points.first.longitude;

    for (var p in points) {
      if (p.latitude < minLat) minLat = p.latitude;
      if (p.latitude > maxLat) maxLat = p.latitude;
      if (p.longitude < minLng) minLng = p.longitude;
      if (p.longitude > maxLng) maxLng = p.longitude;
    }

    final bounds = LatLngBounds(
      southwest: LatLng(minLat, minLng),
      northeast: LatLng(maxLat, maxLng),
    );

    mapController.animateCamera(CameraUpdate.newLatLngBounds(bounds, 130));
  }

  Future<void> _drawRouteOSRM(List<LatLng> points) async {
    String coords = points.map((p) => "${p.longitude},${p.latitude}").join(";");
    final url = Uri.parse(
        "http://router.project-osrm.org/route/v1/driving/$coords?overview=full&geometries=geojson");

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final coordsList = data['routes'][0]['geometry']['coordinates'] as List;

        polylines = [
          Polyline(
            polylineId: const PolylineId("route_line"),
            color: blue,
            width: 4,
            points: coordsList.map((c) => LatLng(c[1], c[0])).toList(),
          ),
        ];
      } else {
        print("❌ OSRM Error: ${response.statusCode}");
      }
    } catch (e) {
      print("❌ Exception OSRM: $e");
    }
  }
}
