import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:waslny_rider/controllers/choose_map_location_controller.dart';

class ChooseLocationMap extends StatelessWidget {
  final ChooseMapLocationController controller =
      Get.put(ChooseMapLocationController());

  final String selectedLocationIconPath = "assets/icons/App-Store.png";

  ChooseLocationMap({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("خريطة"),
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(() {
              return GoogleMap(
                onMapCreated: controller.onMapCreated,
                initialCameraPosition: const CameraPosition(
                  target: LatLng(33.5138, 36.2765), // دمشق
                  zoom: 12,
                ),
                markers: Set<Marker>.from(controller.selectedMarkers),
                onTap: (point) {
                  controller.onMapTapped(
                    point,
                    assetPath: selectedLocationIconPath,
                  );
                },
                zoomControlsEnabled: false,
              );
            }),
          ),
          Container(
            color: Colors.black12,
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            child: Obx(() {
              final address = controller.selectedAddress.value;
              return Text(
                address.isEmpty ? "اضغط على الخريطة لتحديد موقع" : address,
                style: const TextStyle(fontSize: 16),
              );
            }),
          ),
        ],
      ),
    );
  }
}
