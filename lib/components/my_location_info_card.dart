import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:waslny_rider/constants.dart';

class MyLocationInfoCard extends StatelessWidget {
  final String regionName;
  final String fullLocation;
  final VoidCallback ontap;
  const MyLocationInfoCard(
      {super.key,
      required this.regionName,
      required this.fullLocation,
      required this.ontap});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: grey1,
        border: Border.all(color: lightWhite1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          IconButton(
            onPressed: ontap,
            icon: Icon(
              Icons.cancel_outlined,
              color: white,
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Container(
            width: 150,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  regionName,
                  style: TextStyle(
                      color: white, fontSize: 16, fontFamily: 'cairo'),
                ),
                Text(
                  fullLocation,
                  textDirection: TextDirection.rtl,
                  style: TextStyle(
                      color: white, fontSize: 11, fontFamily: 'cairo'),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Container(
            height: 50,
            width: 70,
            child: SvgPicture.asset(
              "assets/icons/Frame 11365.svg",
              height: 20,
            ),
          )
        ],
      ),
    );
  }
}
