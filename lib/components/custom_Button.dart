import 'package:flutter/material.dart';
import 'package:waslny_rider/constants.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback? onTap;
  final String text;
  final bool isEnabled;

  const CustomButton({
    Key? key,
    required this.onTap,
    required this.text,
    this.isEnabled = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isEnabled ? onTap : null,
      style: ElevatedButton.styleFrom(
        fixedSize: const Size(350, 55),
        backgroundColor: blue,
        disabledBackgroundColor: blue.withOpacity(0.6),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontFamily: 'cairo',
        ),
      ),
    );
  }
}
