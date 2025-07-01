import 'package:get/get.dart';
import 'package:flutter/material.dart';

class TimePickerController extends GetxController {
  var selectedHour = DateTime.now().hour.obs;
  var selectedMinute = DateTime.now().minute.obs;

  var isSelectingHour = true.obs;

  // saving value on tap

  void selectHour(int hour) {
    selectedHour.value = hour;
    isSelectingHour.value = false;
  }

  void selectMinute(int minute) {
    selectedMinute.value = minute;
  }

  void resetSelection() {
    isSelectingHour.value = true;
  }

  TimeOfDay get time =>
      TimeOfDay(hour: selectedHour.value, minute: selectedMinute.value);
}
