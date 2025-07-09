import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:waslny_rider/constants.dart';
import 'package:waslny_rider/controllers/googleMapController.dart';

class MapComponent extends StatelessWidget {
  final bool isZoomAble;
  final bool ismoveAble;
  MapComponent({required this.isZoomAble, required this.ismoveAble});
  final Googlemapcontroller controller = Get.put(Googlemapcontroller());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.currentLocation.value == null) {
        return Center(
            child: CircularProgressIndicator(
          color: blue,
        ));
      }

      return GoogleMap(
        onMapCreated: controller.onMapCreated,
        initialCameraPosition: CameraPosition(
          target: controller.currentLocation.value!,
          zoom: 17,
        ),
        myLocationEnabled: true,
        myLocationButtonEnabled: false,
        zoomControlsEnabled: false,
        zoomGesturesEnabled: isZoomAble,
        scrollGesturesEnabled: ismoveAble,
        rotateGesturesEnabled: false,
        compassEnabled: false,
      );
    });
  }
}
