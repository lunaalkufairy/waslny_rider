import 'package:flutter/material.dart';
import 'package:waslny_rider/components/custom_Button.dart';
import 'package:waslny_rider/components/page_top.dart';
import 'package:waslny_rider/constants.dart';

class CacleTripScreen extends StatelessWidget {
  const CacleTripScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black1,
      body: Column(
        children: [
          PageTop(pageName: 'الغاء الرحلة', width: 55),
          SizedBox(
            height: 200,
          ),
          Align(
            alignment: Alignment(0, 0),
            child: Text(
              "سيتم إلغاء رحلتك",
              style: TextStyle(color: red, fontSize: 22, fontFamily: 'cairo'),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          CustomButton(onTap: () {}, text: 'الغاء الرحلة')
        ],
      ),
    );
  }
}
