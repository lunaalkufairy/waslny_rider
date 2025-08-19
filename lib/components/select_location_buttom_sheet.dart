import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waslny_rider/components/circle_Line.dart';
import 'package:waslny_rider/components/custom_Button.dart';
import 'package:waslny_rider/components/custom_input_field.dart';
import 'package:waslny_rider/components/custom_onMap_button.dart';
import 'package:waslny_rider/components/location_grey_circle.dart';
import 'package:waslny_rider/components/location_white_circle.dart';
import 'package:waslny_rider/components/select_price_trip_buttom_sheet.dart';
import 'package:waslny_rider/components/select_trip_type.dart';
import 'package:waslny_rider/constants.dart';
import 'package:waslny_rider/controllers/add_trip_controller.dart';
import 'package:waslny_rider/screens/choose_location_on_map_screen.dart';

class SelectLocationButtomSheet extends StatelessWidget {
  const SelectLocationButtomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    AddTripController controller = Get.find();
    return Stack(children: [
      Container(
        height: 480,
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
              height: 40,
            ),
            Align(
              alignment: Alignment(0.85, 0),
              child: Text(
                "تحديد الوجهة",
                style:
                    TextStyle(color: white, fontSize: 22, fontFamily: 'cairo'),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            GetBuilder<AddTripController>(
              builder: (controller) {
                print('${controller.selectedtripTypeIndex} LUNA');
                return Align(
                  alignment: Alignment(0.88, 0),
                  child: Text(
                    controller.selectedtripTypeIndex == 0
                        ? 'الانطلاق'
                        : "الانطلاق / العودة",
                    style: TextStyle(
                      color: white,
                      fontSize: 18,
                      fontFamily: 'cairo',
                    ),
                  ),
                );
              },
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
                LocationGreyCircle(),
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
            Align(
              alignment: Alignment(0.88, 0),
              child: Text(
                'الوجهة',
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
                LocationWhiteCircle(),
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
              height: 40,
            ),
            CustomButton(
                onTap: () {
                  Get.back();
                  Get.bottomSheet(SelectPriceTripButtomSheet());
                },
                text: 'متابعة')
          ],
        ),
      ),
      Align(
        alignment: Alignment(-0.84, 0.05),
        child: CircleLine(height: 70),
      ),
    ]);
  }
}
