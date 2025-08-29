import 'package:get/get.dart';
import 'package:flutter/material.dart';

class TimePickerController extends GetxController {
  var selectedHour = DateTime.now().hour.obs;
  var selectedMinute = DateTime.now().minute.obs;

  var tempHour = DateTime.now().hour.obs;
  var tempMinute = DateTime.now().minute.obs;

  var isSelectingHour = true.obs;
  Rx<TimeOfDay> time = TimeOfDay.now().obs;

  // saving value on tap
  void selectHourTemp(int hour) {
    tempHour.value = hour;
  }

  void selectMinuteTemp(int minute) {
    tempMinute.value = minute;
  }

  void selectHour(int hour) {
    selectedHour.value = hour;
    isSelectingHour.value = false;
    updateTime();
  }

  void selectMinute(int minute) {
    selectedMinute.value = minute;
    updateTime();
  }

  void commitSelection() {
    selectedHour.value = tempHour.value;
    selectedMinute.value = tempMinute.value;
  }

  void updateTime() {
    time.value =
        TimeOfDay(hour: selectedHour.value, minute: selectedMinute.value);
  }

  void resetSelection() {
    final now = DateTime.now();
    tempHour.value = selectedHour.value;
    tempMinute.value = selectedMinute.value;
    selectedHour.value = now.hour;
    selectedMinute.value = now.minute;
    isSelectingHour.value = true;
    updateTime();
  }

  TimeOfDay get tempTime =>
      TimeOfDay(hour: tempHour.value, minute: tempMinute.value);

  TimeOfDay get getTime =>
      TimeOfDay(hour: selectedHour.value, minute: selectedMinute.value);
}
