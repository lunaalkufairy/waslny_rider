import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:waslny_rider/components/custom_adding_button.dart';
import 'package:waslny_rider/components/my_location_info_card.dart';
import 'package:waslny_rider/components/page_top.dart';
import 'package:waslny_rider/constants.dart';
import 'package:waslny_rider/controllers/saved_location_controller.dart';
import 'package:waslny_rider/screens/adding_address_screen.dart';
import 'package:waslny_rider/screens/choose_location_on_map_screen.dart';

class MyLocationsScreen extends StatefulWidget {
  const MyLocationsScreen({super.key});

  @override
  State<MyLocationsScreen> createState() => _MyLocationsScreenState();
}

class _MyLocationsScreenState extends State<MyLocationsScreen> {
  late SavedLocationController controller;
  @override
  void initState() {
    super.initState();
    controller = Get.put(SavedLocationController());
    controller.getSavedLocations(); // استدعاء أول ما تفتح الصفحة
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: black1,
        body: GetBuilder<SavedLocationController>(
          builder: (controller) {
            return SingleChildScrollView(
              child: Center(
                child: Column(
                  children: [
                    PageTop(pageName: 'عناويني', width: 75),
                    SizedBox(
                      height: 30,
                    ),
                    Align(
                      alignment: Alignment(-0.98, 0.8),
                      child: CustomAddingButton(
                          onPressed: () {
                            Get.off(ChooseLocationOnMapScreen());
                          },
                          backgroundColor: lightBlack,
                          addColor: white),
                    ),
                    controller.isLoading == true
                        ? Column(
                            children: [
                              SizedBox(
                                height: 250,
                              ),
                              Center(
                                child: CircularProgressIndicator(color: blue),
                              ),
                            ],
                          )
                        : controller.savedAddresses!.length == 0
                            ? Center(
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 250,
                                    ),
                                    Text(
                                      "لا توجد عناوين لعرضها حاليا",
                                      style: TextStyle(
                                          color: white,
                                          fontSize: 18,
                                          fontFamily: 'cairo'),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    SvgPicture.asset(
                                      "assets/icons/Map Point Wave.svg",
                                      height: 70,
                                    ),
                                  ],
                                ),
                              )
                            : SizedBox(
                                height: 670,
                                width: double.infinity,
                                child: ListView.builder(
                                  padding: EdgeInsets.only(top: 10),
                                  itemCount: controller.savedAddresses!.length,
                                  itemBuilder: (context, index) {
                                    return GestureDetector(
                                      onTap: () {
                                        // Get.to(OrderInformationScreen());
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            top: 16, left: 16, right: 16),
                                        child: MyLocationInfoCard(
                                            ontap: () {
                                              controller.deleteLocation(
                                                  controller
                                                      .savedAddresses[index]
                                                      .id);
                                            },
                                            regionName: controller
                                                .savedAddresses[index].city,
                                            fullLocation: controller
                                                    .savedAddresses[index]
                                                    .state +
                                                '-' +
                                                controller.savedAddresses[index]
                                                    .city +
                                                '-' +
                                                controller.savedAddresses[index]
                                                    .suburb),
                                      ),
                                    );
                                  },
                                ),
                              )
                  ],
                ),
              ),
            );
          },
        ));
  }
}
