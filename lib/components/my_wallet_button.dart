import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:waslny_rider/constants.dart';

class MyWalletButton extends StatelessWidget {
  VoidCallback onTap;
  MyWalletButton({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 64,
        width: 136,
        padding: const EdgeInsets.symmetric(horizontal: 21),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: black.withOpacity(0.2),
              blurRadius: 6,
              offset: Offset(0, 3),
            )
          ],
        ),
        child: Row(
          children: [
            Text('محفظتي', style: TextStyle(fontFamily: 'cairo')),
            SizedBox(width: 8),
            SvgPicture.asset(
              'assets/icons/Wallet.svg',
              color: black,
            )
          ],
        ),
      ),
    );
  }
}
