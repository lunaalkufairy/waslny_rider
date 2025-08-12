import 'package:flutter/material.dart';
import 'package:waslny_rider/components/select_person_options.dart';
import 'package:waslny_rider/constants.dart';

class CustomaizTripButtomSheet extends StatelessWidget {
  const CustomaizTripButtomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600,
      width: double.infinity,
      decoration: BoxDecoration(
          color: black,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30))),
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Container(
            decoration: BoxDecoration(
                color: white, borderRadius: BorderRadius.circular(20)),
            height: 5,
            width: 70,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "تخصيص الرحلة",
            style: TextStyle(color: white, fontSize: 20, fontFamily: 'cairo'),
          ),
          SizedBox(
            height: 5,
          ),
          SizedBox(width: 300, child: Divider()),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 200.0),
            child: Text(
              "تفضيلات شخصية",
              style: TextStyle(color: white, fontSize: 18, fontFamily: 'cairo'),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          SelectPersonalOptions()
        ],
      ),
    );
  }
}
