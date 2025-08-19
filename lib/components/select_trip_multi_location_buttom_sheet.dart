import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:waslny_rider/components/circle_Line.dart';
import 'package:waslny_rider/components/custom_Button.dart';
import 'package:waslny_rider/components/location_grey_center_circle.dart';
import 'package:waslny_rider/components/location_grey_circle.dart';
import 'package:waslny_rider/components/location_white_circle.dart';
import 'package:waslny_rider/components/select_price_trip_buttom_sheet.dart';
import 'package:waslny_rider/constants.dart';
import 'package:waslny_rider/controllers/add_trip_controller.dart';
import 'package:waslny_rider/screens/choose_location_on_map_screen.dart';

class SelectTripMultiLocationButtomSheet extends StatelessWidget {
  const SelectTripMultiLocationButtomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    AddTripController controller = Get.find();
    return Container(
      height: 600,
      width: double.infinity,
      decoration: BoxDecoration(
        color: black,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Container(
            decoration: BoxDecoration(
                color: white, borderRadius: BorderRadius.circular(20)),
            height: 5,
            width: 100,
          ),
          SizedBox(
            height: 30,
          ),
          Align(
            alignment: Alignment(0.85, 0),
            child: Text(
              "تحديد الوجهة",
              style: TextStyle(color: white, fontSize: 22, fontFamily: 'cairo'),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          GetBuilder<AddTripController>(
            builder: (controller) {
              return Container(
                height: 230,
                child: ListView.builder(
                  itemCount: controller.locations.length,
                  itemBuilder: (context, index) {
                    return Column(children: [
                      Align(
                        alignment: Alignment(0.88, 0),
                        child: Text(
                          index == 0
                              ? 'الانطلاق'
                              : index == controller.locations.length - 1
                                  ? "نقطة الوصول"
                                  : '$index الوجهة',
                          style: TextStyle(
                            color: white,
                            fontSize: 18,
                            fontFamily: 'cairo',
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            width: 20,
                          ),
                          index == 0
                              ? LocationGreyCircle()
                              : index == controller.locations.length - 1
                                  ? LocationWhiteCircle()
                                  : LocationGreyCenterCircle(),
                          SizedBox(
                            width: 20,
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.to(ChooseLocationOnMapScreen());
                            },
                            child: Container(
                                width: 310,
                                height: 60,
                                decoration: BoxDecoration(
                                    border: Border.all(color: lightWhite),
                                    borderRadius: BorderRadius.circular(20)),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      "تحديد الوجهة",
                                      style: TextStyle(
                                          color: white,
                                          fontSize: 14,
                                          fontFamily: 'cairo'),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Icon(
                                      Icons.location_on_rounded,
                                      color: blue,
                                      size: 30,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                  ],
                                )),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ]);
                  },
                  padding: EdgeInsets.all(0),
                ),
              );
            },
          ),
          SizedBox(
            height: 10,
          ),
          Align(
            alignment: Alignment(-0.3, 0.7),
            child: GestureDetector(
              onTap: () {
                controller.addNewLocations();
              },
              child: Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    "+",
                    style: TextStyle(
                        color: white, fontSize: 29, fontFamily: 'cairo'),
                  ),
                  Text(
                    " إضافة توقف",
                    style: TextStyle(
                        color: blue, fontSize: 17, fontFamily: 'cairo'),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          CustomButton(
              onTap: () {
                Get.back();
                Get.bottomSheet(SelectPriceTripButtomSheet());
              },
              text: 'متابعة')
        ],
      ),
    );
  }
}
