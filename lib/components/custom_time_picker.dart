// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:waslny_rider/constants.dart';
import 'package:waslny_rider/controllers/time_picker_controller.dart';
import 'package:waslny_rider/tools/clock_view.dart';

class CustomTimePicker extends StatelessWidget {
  CustomTimePicker({super.key});
  //TimeOfDay timeOfDay = TimeOfDay.now();

  @override
  Widget build(BuildContext context) {
    //final controller = Get.put(TimePickerController());
    return GetBuilder<TimePickerController>(
      init: TimePickerController(),
      builder: (controller) {
        return TextButton(
          // onPressed: () {
          //   controller.resetSelection();
          //   _customShowTimePicker(context);
          // },
          onPressed: () {
            controller.resetSelection();
            _customShowTimePicker(context, controller);
          },
          style: TextButton.styleFrom(
            backgroundColor: black1,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.circular(15),
              side: BorderSide(
                color: lightWhite,
              ),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Obx(
                () => Text(
                  controller.getTime.format(context),
                  textAlign: TextAlign.right,
                  textDirection: TextDirection.rtl,
                  style: TextStyle(
                    fontFamily: 'cairo',
                    color: white,
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                  height: 32,
                  width: 32,
                  padding: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                      color: blue, borderRadius: BorderRadius.circular(10)),
                  child: SvgPicture.asset('assets/icons/Clock Circle.svg')),
            ],
          ),
        );
      },
    );
  }

  void _customShowTimePicker(
      BuildContext context, TimePickerController controller) {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (_) => Dialog(
              backgroundColor: black1,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: SizedBox(
                  width: double.maxFinite,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'تحديد الوقت',
                        style: TextStyle(
                          color: white,
                          fontSize: 18,
                          fontFamily: 'Cairo',
                        ),
                      ),
                      const SizedBox(height: 20),
                      Obx(
                        () => Text(
                          controller.getTime.format(context),
                          style: TextStyle(
                              fontSize: 20, color: grey2, fontFamily: 'Cairo'),
                        ),
                      ),
                      const SizedBox(height: 20),
                      //--------- Custom Clock ----------
                      Obx(() => AnimatedSwitcher(
                            duration: Duration(milliseconds: 500),
                            child: ClockView(
                              key: ValueKey(controller.isSelectingHour.value),
                            ),
                          )),
                      const SizedBox(height: 20),
                      Center(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          GestureDetector(
                            onTap: () => Get.back(),
                            child: Container(
                              width: 110,
                              height: 45,
                              decoration: BoxDecoration(
                                color: white,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                'إلغاء',
                                style: TextStyle(
                                  fontFamily: 'Cairo',
                                  fontSize: 15,
                                  color: black1,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          GestureDetector(
                            onTap: () {
                              if (controller.isSelectingHour.value) {
                                controller.isSelectingHour.value = false;
                              } else {
                                controller.commitSelection();
                                print(controller.selectedHour);
                                Get.back();
                              }
                            },
                            child: Obx(
                              () => Container(
                                width: 110,
                                height: 45,
                                decoration: BoxDecoration(
                                  color: blue,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                alignment: Alignment.center,
                                child: Text(
                                  controller.isSelectingHour.value
                                      ? 'التالي'
                                      : 'تم',
                                  style: TextStyle(
                                    fontFamily: 'Cairo',
                                    fontSize: 15,
                                    color: white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )),
                    ],
                  ),
                ),
              ),
            ));
  }
}
