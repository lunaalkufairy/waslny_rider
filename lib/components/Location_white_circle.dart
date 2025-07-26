import 'package:flutter/material.dart';
import 'package:waslny_rider/constants.dart';

class LocationWhiteCircle extends StatelessWidget {
  const LocationWhiteCircle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 25,
      height: 38,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: white,
      ),
      alignment: Alignment(0, 0.5),
      child: Container(
        width: 10,
        height: 10,
        decoration: BoxDecoration(
          color: black,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
