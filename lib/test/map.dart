import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:waslny_rider/test/controller.dart';

class RouteMapWidget extends StatelessWidget {
  final RouteMapController controller = Get.put(RouteMapController());
  final List<LatLng> points;
  final List<String> markerIconPaths;

  RouteMapWidget({
    super.key,
    required this.points,
    required this.markerIconPaths,
  });

  @override
  Widget build(BuildContext context) {
    // إعداد النقاط مع أيقونات الماركر
    controller.setPointsWithIcons(points, markerIconPaths);

    return Scaffold(
      body: GetBuilder<RouteMapController>(
        builder: (_) {
          return GoogleMap(
            onMapCreated: controller.onMapCreated,
            initialCameraPosition: CameraPosition(
              target:
                  points.isNotEmpty ? points.first : LatLng(33.5138, 36.2765),
              zoom: 12,
            ),
            markers: controller.markers.toSet(),
            polylines: controller.polylines.toSet(),
            myLocationEnabled: true,
            myLocationButtonEnabled: false,
            zoomControlsEnabled: false,
          );
        },
      ),
    );
  }
}
