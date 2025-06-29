import 'package:flutter/material.dart';
import 'package:waslny_rider/constants.dart';

class CircleLine extends StatelessWidget {
  final double height;
  final Color color;
  final double circleRadius;
  final double spacing;

  const CircleLine({
    super.key,
    required this.height,
    this.color = white,
    this.circleRadius = 1.5,
    this.spacing = 3,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(circleRadius * 2, height),
      painter: _CircleLinePainter(
        color: color,
        circleRadius: circleRadius,
        spacing: spacing,
      ),
    );
  }
}

class _CircleLinePainter extends CustomPainter {
  final Color color;
  final double circleRadius;
  final double spacing;

  _CircleLinePainter({
    required this.color,
    required this.circleRadius,
    required this.spacing,
  });

  @override
  void paint(Canvas canvas, Size size) {
    double startY = 0;
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    while (startY < size.height) {
      canvas.drawCircle(
        Offset(size.width / 2, startY + circleRadius),
        circleRadius,
        paint,
      );
      startY += (2 * circleRadius) + spacing;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
