import 'package:get/get.dart';

class DatePickerController extends GetxController {
  var selectedDay = DateTime.now().obs;
  var focusedDay = DateTime.now().obs;
  Rx<DateTime?> tempSelectedDay = DateTime.now().obs;
  void setTempSelectedDay(DateTime selected, DateTime focused) {
    tempSelectedDay.value = selected;
    focusedDay.value = focused;
  }

  void confirmSelection() {
    selectedDay.value = tempSelectedDay.value!;
  }

  void resetSelection() {
    selectedDay.value = DateTime.now();
    focusedDay.value = DateTime.now();
    update();
  }

  DateTime get getSelectedDay => selectedDay.value;
}
