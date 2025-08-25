import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:waslny_rider/controllers/choose_map_location_controller.dart';

class ChooseMap extends StatelessWidget {
  const ChooseMap({super.key});

  @override
  Widget build(BuildContext context) {
    ChooseMapLocationController controller = Get.find();

    return GetBuilder<ChooseMapLocationController>(
      builder: (controller) {
        return GoogleMap(
          onMapCreated: controller.onMapCreated,
          initialCameraPosition: const CameraPosition(
            target: LatLng(33.5138, 36.2765),
            zoom: 12,
          ),
          markers: controller.selectedMarkers.toSet(),
          myLocationEnabled: true,
          myLocationButtonEnabled: false,
          zoomControlsEnabled: false,
          onTap: controller.onMapTapped,
        );
      },
    );
  }
}
