import 'package:flutter/material.dart';
import 'package:waslny_rider/constants.dart';

class CustomArrow extends StatelessWidget {
  final VoidCallback onPressed;
  const CustomArrow({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: const CircleBorder(),
        padding: const EdgeInsets.all(12),
        backgroundColor: lightBlack,
        elevation: 10,
      ),
      child: const Icon(
        Icons.arrow_forward_ios_rounded,
        color: Colors.white,
        size: 20,
      ),
    );
  }
}
