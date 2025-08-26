import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waslny_rider/components/choose_location_text.dart';
import 'package:waslny_rider/components/custom_Button.dart';
import 'package:waslny_rider/components/googleMap.dart';
import 'package:waslny_rider/constants.dart';
import 'package:waslny_rider/components/choose_map.dart';
import 'package:waslny_rider/controllers/choose_map_location_controller.dart';
import 'package:waslny_rider/controllers/saved_location_controller.dart';

class ChooseLocationOnMapScreen extends StatelessWidget {
  const ChooseLocationOnMapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SavedLocationController savedLocationController =
        Get.put(SavedLocationController());

    ChooseMapLocationController controller =
        Get.put(ChooseMapLocationController());
    return Scaffold(
      backgroundColor: black1,
      body: Stack(
        children: [
          ChooseMap(),
          GetBuilder<ChooseMapLocationController>(
            builder: (controller) {
              if (controller.isLoading)
                return const Center(
                  child: CircularProgressIndicator(color: blue),
                );
              return Center();
            },
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 18.0),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: CustomButton(
                  onTap: () {
                    print(controller.latitude);
                    print(controller.longitude);
                    savedLocationController.lat = controller.latitude;
                    savedLocationController.long = controller.longitude;
                    print(savedLocationController.lat);
                    print(savedLocationController.long);
                    savedLocationController.saveRiderLocation();
                  },
                  text: "حفظ"),
            ),
          ),
          Align(
              alignment: Alignment(0, -0.85),
              child: GetBuilder<ChooseMapLocationController>(
                builder: (controller) {
                  return ChooseLocationText(
                    location:
                        "${controller.state}-${controller.city}-${controller.suburb}-${controller.street}",
                  );
                },
              ))
        ],
      ),
    );
  }
}
