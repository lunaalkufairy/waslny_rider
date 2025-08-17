import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:waslny_rider/components/custom_arrow.dart';
import 'package:waslny_rider/constants.dart';

class ChooseLocationText extends StatelessWidget {
  const ChooseLocationText({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 360,
      height: 70,
      decoration: BoxDecoration(
          color: lightBlack, borderRadius: BorderRadius.circular(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            width: 280,
            height: 50,
            child: TextField(
              enabled: false,
              onChanged: (value) {},
              keyboardType: TextInputType.streetAddress,
              style: TextStyle(
                color: white,
                fontFamily: 'cairo',
                fontSize: 18,
              ),
              textDirection: TextDirection.rtl,
              textAlign: TextAlign.right,
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(0),
                  filled: true,
                  fillColor: black,
                  hintText: "اختار الموقع",
                  hintStyle: TextStyle(
                    color: white,
                    fontFamily: 'cairo',
                    fontSize: 14,
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: black1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  suffixIcon: Icon(
                    Icons.location_on_rounded,
                    color: white,
                    size: 30,
                  )),
            ),
          ),
          SizedBox(
            width: 7,
          ),
          CustomArrow(
            onPressed: () {
              Get.back();
            },
            backgroundColor: white,
            arrowColor: lightBlack,
          ),
        ],
      ),
    );
  }
}
