///
/// ---------------------IMPORTAAAAAAAAAAAAAAAAAAANT-----------------
///  1. لازم اول ما يفتح الديالوج يكون على الشهر اللي فيه اليوم اللي اختاره اليوزر
///  2. ضروري نشوف الساعة منشان قصة الالغاء والمتابعة
library;

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:waslny_rider/constants.dart';
import 'package:waslny_rider/controllers/date_picker_controller.dart';
import 'package:waslny_rider/tools/calendar_view.dart';

class CustomDatePicker extends StatelessWidget {
  const CustomDatePicker({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DatePickerController>(
        init: DatePickerController(),
        builder: (controller) {
          return TextButton(
            onPressed: () {
              initializeDateFormatting('ar').then((_) {
                _customShowDatePicker(context, controller);
              });
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
                    '${controller.selectedDay.value.year}/${controller.selectedDay.value.month}/${controller.selectedDay.value.day}',
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
                    color: blue,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: SvgPicture.asset('assets/icons/Calendar.svg'),
                ),
              ],
            ),
          );
        });
  }

  void _customShowDatePicker(
      BuildContext context, DatePickerController controller) {
    controller.tempSelectedDay.value = controller.selectedDay.value;
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (_) => Dialog(
        backgroundColor: black1,
        insetPadding: EdgeInsets.symmetric(horizontal: 15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: EdgeInsetsGeometry.all(20),
          child: SizedBox(
            height: 450,
            width: double.maxFinite,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                //const SizedBox(height: 10),
                CalendarView(),
                const SizedBox(height: 20),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(horizontal: 40),
                          backgroundColor: white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadiusGeometry.circular(15),
                          ),
                        ),
                        onPressed: () {
                          Get.back();
                        },
                        child: Text(
                          'إلغاء',
                          style: TextStyle(
                            fontFamily: 'Cairo',
                            fontSize: 15,
                            color: black1,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(horizontal: 30),
                          backgroundColor: blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadiusGeometry.circular(15),
                          ),
                        ),
                        onPressed: () {
                          controller.confirmSelection();
                          Get.back();
                        },
                        child: Text(
                          'اختيار اليوم',
                          style: TextStyle(
                            fontFamily: 'Cairo',
                            fontSize: 15,
                            color: white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
