import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:waslny_rider/constants.dart';

class CustomizeTripButton extends StatelessWidget {
  VoidCallback onTap;
  CustomizeTripButton({required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 170,
        height: 64,
        padding: const EdgeInsets.symmetric(
          horizontal: 22,
        ),
        decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 6,
              offset: Offset(0, 3),
            )
          ],
        ),
        child: Row(
          children: [
            Text('تخصيص الرحلة', style: TextStyle(fontFamily: 'cairo')),
            SizedBox(width: 8),
            SvgPicture.asset(
              'assets/icons/Customize.svg',
              color: black,
            )
          ],
        ),
      ),
    );
  }
}
