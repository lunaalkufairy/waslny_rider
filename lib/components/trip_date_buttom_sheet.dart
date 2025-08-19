import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waslny_rider/components/custom_Button.dart';
import 'package:waslny_rider/components/custom_date_picker.dart';
import 'package:waslny_rider/components/custom_time_picker.dart';
import 'package:waslny_rider/components/trip_type_buttom_sheet.dart';
import 'package:waslny_rider/constants.dart';
import 'package:waslny_rider/controllers/add_trip_controller.dart';
import 'package:waslny_rider/controllers/date_picker_controller.dart';
import 'package:waslny_rider/controllers/time_picker_controller.dart';

class TripDateButtomSheet extends StatelessWidget {
  const TripDateButtomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    AddTripController controller = Get.put(AddTripController());
    DatePickerController datePickerController = Get.put(DatePickerController());
    TimePickerController timePickerController = Get.put(TimePickerController());

    return Container(
      height: 300,
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
              "التاريخ والوقت",
              style: TextStyle(color: white, fontSize: 22, fontFamily: 'cairo'),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Align(
            alignment: Alignment(0.85, 0),
            child: Text(
              ": التاريخ والوقت",
              style: TextStyle(color: white, fontSize: 16, fontFamily: 'cairo'),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomDatePicker(),
              CustomTimePicker(),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          CustomButton(
              onTap: () {
                Get.back();
                Get.bottomSheet(TripTypeButtomSheet());
              },
              text: 'متابعة')
        ],
      ),
    );
  }
}
