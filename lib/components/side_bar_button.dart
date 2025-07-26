import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:waslny_rider/constants.dart';

class SideBarButton extends StatelessWidget {
  VoidCallback onTap;
  SideBarButton({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          padding: EdgeInsets.all(10.0),
          width: 50,
          height: 50,
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 6,
                offset: Offset(0, 3),
              )
            ],
          ),
          child: SvgPicture.asset(
            'assets/icons/SideBar.svg',
            color: black,
            width: 10,
            height: 10,
          )),
    );
  }
}
