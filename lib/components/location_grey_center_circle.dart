import 'package:flutter/material.dart';

class LocationGreyCenterCircle extends StatelessWidget {
  const LocationGreyCenterCircle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 25,
      height: 38,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.grey,
      ),
      alignment: Alignment(0, 0),
      child: Container(
        width: 10,
        height: 10,
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
