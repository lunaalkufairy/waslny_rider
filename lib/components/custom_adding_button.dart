import 'package:flutter/material.dart';

class CustomAddingButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color addColor;
  CustomAddingButton({
    super.key,
    required this.onPressed,
    required this.backgroundColor,
    required this.addColor,
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
        Icons.add,
        color: addColor,
        size: 20,
      ),
    );
  }
}
