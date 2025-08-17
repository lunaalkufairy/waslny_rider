import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:waslny_rider/components/custom_adding_button.dart';
import 'package:waslny_rider/components/my_location_info_card.dart';
import 'package:waslny_rider/components/page_top.dart';
import 'package:waslny_rider/constants.dart';
import 'package:waslny_rider/controllers/my_locations_controller.dart';
import 'package:waslny_rider/screens/adding_address_screen.dart';

class MyLocationsScreen extends StatelessWidget {
  const MyLocationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    MyLocationsController controller = Get.put(MyLocationsController());
    return Scaffold(
      backgroundColor: black1,
      body: SingleChildScrollView(
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
                      Get.to(AddingAddressScreen());
                    },
                    backgroundColor: lightBlack,
                    addColor: white),
              ),
              controller.locations!.length == 0
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
                      height: 753,
                      width: double.infinity,
                      child: ListView.builder(
                        padding: EdgeInsets.only(top: 10),
                        itemCount: controller.locations!.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              // Get.to(OrderInformationScreen());
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 16, left: 16, right: 16),
                              child: MyLocationInfoCard(
                                  regionName: 'الشعلان',
                                  fullLocation: 'دمشق - سوريا'),
                            ),
                          );
                        },
                      ),
                    )
            ],
          ),
        ),
      ),
    );
  }
}
