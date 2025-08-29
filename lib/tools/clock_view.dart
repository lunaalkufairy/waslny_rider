// ignore_for_file: must_be_immutable

import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waslny_rider/constants.dart';
import 'package:waslny_rider/controllers/date_picker_controller.dart';
import 'package:waslny_rider/controllers/time_picker_controller.dart';

int? selectedHourValue;
final timeController = Get.find<TimePickerController>();
final dateController = Get.find<DatePickerController>();
var dateTime = DateTime.now();

class ClockView extends StatelessWidget {
  ClockView({super.key});

  int selectedHour = DateTime.now().hour;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: 250,
      child: GestureDetector(
        onTapUp: (details) {
          RenderBox box = context.findRenderObject() as RenderBox;
          Offset local = box.globalToLocal(details.globalPosition);
          _handleTap(local, timeController);
        },
        child: Obx(() {
          return CustomPaint(
            painter: ClockPainter(
              isSelectingHour: timeController.isSelectingHour.value,
              selectedValue: timeController.isSelectingHour.value
                  ? timeController.tempHour.value
                  : timeController.tempMinute.value,
            ),
          );
        }),
      ),
    );
  }

  void _handleTap(Offset position, TimePickerController controller) {
    double centerX = 125;
    double centerY = 125;
    double dx = position.dx - centerX;
    double dy = position.dy - centerY;
    double angle = atan2(dy, dx);
    double degrees = (angle * 180 / pi + 90) % 360;
    int tapped = ((degrees / 30).round()) % 12;
    tapped = tapped == 0 ? 12 : tapped;

    if (controller.isSelectingHour.value) {
      int tappedHour12 = ((degrees / 30).round()) % 12;
      tappedHour12 = tappedHour12 == 0 ? 12 : tappedHour12;
      int tappedHour24;
      if (dateTime.hour < 12) {
        tappedHour24 = tappedHour12 % 12; // صباحي
      } else {
        tappedHour24 = tappedHour12 % 12 + 12; // مسائي
      }

      if (dateController.getSelectedDay.year == dateTime.year &&
          dateController.getSelectedDay.month == dateTime.month &&
          dateController.getSelectedDay.day == dateTime.day) {
        if (tappedHour24 < dateTime.hour) {
          return;
        }
        ; // لا تسمح باختيار ساعات سابقة
      }
      controller.selectHourTemp(tappedHour24);
    } else {
      int tappedMinute = ((degrees / 6).round()) % 60;

      // لا تسمح بالضغط على دقائق سابقة في نفس الساعة
      if (dateController.getSelectedDay.year == dateTime.year &&
          dateController.getSelectedDay.month == dateTime.month &&
          dateController.getSelectedDay.day == dateTime.day &&
          timeController.tempHour == timeController.selectedHour) {
        if (tappedMinute < dateTime.minute) {
          return;
        }
      }
      controller.selectMinuteTemp(tappedMinute);
    }
  }
}

class ClockPainter extends CustomPainter {
  final int selectedValue;
  final bool isSelectingHour;

  ClockPainter({required this.selectedValue, required this.isSelectingHour});

  // 60 sec - 360 deg  , 1 sec - 6 deg
  //12 hours - 360deg , 1 hour - 30 deg , 1 min - 0.5 deg

  @override
  void paint(Canvas canvas, Size size) {
    var centerX = size.width / 2;
    var centerY = size.height / 2;
    var center = Offset(centerX, centerY);
    var radius = min(centerX, centerY);

    var fillBrush = Paint()..color = white;
    var centerFillBrush = Paint()..color = blue;
    var handBrush = Paint()
      ..color = blue
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.round;
    //Background :
    canvas.drawCircle(center, radius - 20, fillBrush);
    int divisions = isSelectingHour ? 12 : 60; // ستستخدم نفس الدائرة
    //Clock hands :
    // var minHandX = centerX + 60 * cos(dateTime.minute * 6 * pi / 180 - 90);
    // var minHandY = centerX + 60 * sin(dateTime.minute * 6 * pi / 180 - 90);
    // canvas.drawLine(center, Offset(minHandX, minHandY), minHandBrush);
    final angle = ((selectedValue * (360 / divisions) - 90) * pi / 180);
    var hourHandX = centerX + 85 * cos(angle);
    var hourHandY = centerX + 85 * sin(angle);
    canvas.drawLine(center, Offset(hourHandX, hourHandY), handBrush);
    canvas.drawCircle(Offset(hourHandX, hourHandY), 18, centerFillBrush);
    //Numbers :
    for (int i = 1; i <= divisions; i++) {
      // final value = isSelectingHour ? i : (i * 5 % 60);
      // bool isPast = false;
      // if (isSelectingHour) {
      //   int hour24;
      //   if (dateTime.hour < 12) {
      //     hour24 = i % 12; // صباح
      //   } else {
      //     hour24 = i % 12 + 12; // مساء
      //   }
      //   if (hour24 < dateTime.hour) isPast = true;
      // } else {
      //   if (controller.selectedHour.value == dateTime.hour &&
      //       value < dateTime.minute) {
      //     isPast = true;
      //   }
      // }
      final angle = (i * 30 - 90) * pi / 180; // نخصم 90 درجة لنبدأ من الأعلى
      final radiusOffset = 40; // حتى يكون الرقم داخل الساعة شوي
      final x = centerX + (radius - radiusOffset) * cos(angle);
      final y = centerY + (radius - radiusOffset) * sin(angle);

      final textPainter = TextPainter(
        text: TextSpan(
          text: '${isSelectingHour ? i : i * 5 % 60}',
          style: TextStyle(
              color: black,
              fontSize: isSelectingHour ? 18 : 12,
              fontWeight: FontWeight.bold),
        ),
        textDirection: TextDirection.ltr,
        textAlign: TextAlign.center,
      )..layout();

      // استخدم offset لتوسيط الرقم مكانه
      final offset = Offset(
        x - textPainter.width / 2,
        y - textPainter.height / 2,
      );

      textPainter.paint(canvas, offset);
    }
    //Iner circle :
    canvas.drawCircle(center, 4, centerFillBrush);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
