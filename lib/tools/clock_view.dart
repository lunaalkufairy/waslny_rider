import 'dart:math';
import 'package:flutter/material.dart';
import 'package:waslny_rider/constants.dart';

int? selectedHourValue;

class ClockView extends StatefulWidget {
  const ClockView({super.key});

  @override
  State<ClockView> createState() => _ClockViewState();
}

class _ClockViewState extends State<ClockView> {
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
          _handleTap(local);
        },
        child: CustomPaint(
          painter: ClockPainter(selectedHour),
        ),
      ),
    );
  }

  void _handleTap(Offset position) {
    double centerX = 125;
    double centerY = 125;
    double dx = position.dx - centerX;
    double dy = position.dy - centerY;
    double angle = atan2(dy, dx);
    double degrees = (angle * 180 / pi + 90) % 360;
    int tappedHour = ((degrees / 30).round()) % 12;

    setState(() {
      selectedHour = tappedHour == 0 ? 12 : tappedHour;
      selectedHourValue = selectedHour;
    });
    //print('houuuuuuuur + $selectedHourValue');
  }
}

class ClockPainter extends CustomPainter {
  final int selectedHour;
  var dateTime = DateTime.now();
  ClockPainter(this.selectedHour);

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
    // var minHandBrush = Paint()
    //   ..color = blue
    //   ..strokeWidth = 2
    //   ..strokeCap = StrokeCap.round;
    var hourHandBrush = Paint()
      ..color = blue
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.round;
    //Background :
    canvas.drawCircle(center, radius - 20, fillBrush);

    //Clock hands :
    // var minHandX = centerX + 60 * cos(dateTime.minute * 6 * pi / 180 - 90);
    // var minHandY = centerX + 60 * sin(dateTime.minute * 6 * pi / 180 - 90);
    // canvas.drawLine(center, Offset(minHandX, minHandY), minHandBrush);
    var hourHandX = centerX + 85 * cos((selectedHour * 30 - 90) * pi / 180);
    var hourHandY = centerX + 85 * sin((selectedHour * 30 - 90) * pi / 180);
    canvas.drawLine(center, Offset(hourHandX, hourHandY), hourHandBrush);
    canvas.drawCircle(Offset(hourHandX, hourHandY), 18, centerFillBrush);
    //Numbers :
    for (int i = 1; i <= 12; i++) {
      final angle = (i * 30 - 90) * pi / 180; // نخصم 90 درجة لنبدأ من الأعلى
      final radiusOffset = 40; // حتى يكون الرقم داخل الساعة شوي
      final x = centerX + (radius - radiusOffset) * cos(angle);
      final y = centerY + (radius - radiusOffset) * sin(angle);

      final textPainter = TextPainter(
        text: TextSpan(
          text: '$i',
          style: TextStyle(
            color: black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
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
