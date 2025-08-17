import 'package:flutter/material.dart';
import 'package:waslny_rider/components/choose_location_text.dart';
import 'package:waslny_rider/components/custom_Button.dart';
import 'package:waslny_rider/components/googleMap.dart';
import 'package:waslny_rider/constants.dart';

class ChooseLocationOnMapScreen extends StatelessWidget {
  const ChooseLocationOnMapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black1,
      body: Stack(
        children: [
          MapComponent(isZoomAble: true, ismoveAble: true),
          Padding(
            padding: const EdgeInsets.only(bottom: 18.0),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: CustomButton(onTap: () {}, text: "حفظ"),
            ),
          ),
          Align(
            alignment: Alignment(0, -0.85),
            child: ChooseLocationText(),
          )
        ],
      ),
    );
  }
}
