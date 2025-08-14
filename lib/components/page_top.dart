import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:waslny_rider/components/custom_arrow.dart';
import 'package:waslny_rider/constants.dart';

class PageTop extends StatelessWidget {
  String pageName;
  double width;
  PageTop({super.key, required this.pageName, required this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      alignment: Alignment.bottomCenter,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            pageName,
            style: TextStyle(color: white, fontSize: 25, fontFamily: 'cairo'),
          ),
          SizedBox(
            width: width,
          ),
          CustomArrow(
              backgroundColor: lightBlack,
              arrowColor: white,
              onPressed: () {
                Get.back();
              }),
          SizedBox(
            width: 10,
          ),
        ],
      ),
    );
  }
}
