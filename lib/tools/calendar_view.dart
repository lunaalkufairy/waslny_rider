import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:waslny_rider/constants.dart';
import 'package:waslny_rider/controllers/date_picker_controller.dart';

class CalendarView extends StatelessWidget {
  CalendarView({super.key});
  final controller = Get.find<DatePickerController>();
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => TableCalendar(
        locale: 'ar',
        rowHeight: 48,
        daysOfWeekHeight: 20,
        availableGestures: AvailableGestures.all,
        focusedDay: controller.focusedDay.value,
        firstDay: DateTime.utc(
            DateTime.now().year, DateTime.now().month, DateTime.now().day),
        lastDay: DateTime.utc(2040, 12, 31),
        calendarStyle: CalendarStyle(
          outsideDecoration: BoxDecoration(
            color: white,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(12),
          ),
          weekendDecoration: BoxDecoration(
            color: white,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(12),
          ),
          defaultDecoration: BoxDecoration(
            color: white,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(12),
          ),
          todayDecoration: BoxDecoration(
            color: white,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(12),
          ),
          selectedDecoration: BoxDecoration(
            color: blue,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(12),
          ),
          defaultTextStyle: TextStyle(color: grey1, fontFamily: 'Cairo'),
          weekendTextStyle: TextStyle(color: grey1, fontFamily: 'Cairo'),
          outsideTextStyle: TextStyle(
            color: lightWhite1,
            fontFamily: 'Cairo',
          ),
          todayTextStyle: TextStyle(
              color: controller.tempSelectedDay.value == DateTime.now()
                  ? white
                  : grey1,
              fontWeight: FontWeight.bold),
          selectedTextStyle:
              TextStyle(color: white, fontWeight: FontWeight.bold),
        ),
        headerStyle: HeaderStyle(
          titleCentered: true,
          headerPadding: EdgeInsets.only(left: 10, right: 10, bottom: 25),
          titleTextStyle: TextStyle(
            color: white,
            fontFamily: 'Cairo',
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          leftChevronIcon: Icon(Icons.chevron_left, color: white1),
          rightChevronIcon: Icon(Icons.chevron_right, color: white1),
          formatButtonVisible: false,
        ),
        daysOfWeekStyle: DaysOfWeekStyle(
          weekdayStyle: TextStyle(
            color: white,
            fontFamily: 'Cairo',
            fontSize: 10,
          ),
          weekendStyle: TextStyle(
            color: white,
            fontFamily: 'Cairo',
            fontSize: 10,
          ),
        ),
        selectedDayPredicate: (day) {
          return isSameDay(
              day,
              controller.tempSelectedDay
                  .value); // مؤقتًا، خلي المختار هو اليوم الحالي
        },
        onDaySelected: (selected, focused) {
          controller.setTempSelectedDay(selected, focused);
        },
      ),
    );
  }
}
