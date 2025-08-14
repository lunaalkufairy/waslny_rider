import 'package:flutter/material.dart';
import 'package:waslny_rider/constants.dart';

class CustomArrow extends StatelessWidget {
  final VoidCallback onPressed;
  Color backgroundColor;
  Color arrowColor;
  CustomArrow({
    super.key,
    required this.onPressed,
    required this.backgroundColor,
    required this.arrowColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: const CircleBorder(),
        padding: const EdgeInsets.all(12),
        backgroundColor: backgroundColor,
        elevation: 10,
      ),
      child: Icon(
        Icons.arrow_forward_ios_rounded,
        color: arrowColor,
        size: 20,
      ),
    );
  }
}
