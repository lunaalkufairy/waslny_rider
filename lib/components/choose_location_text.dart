import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';
import 'package:waslny_rider/components/custom_arrow.dart';
import 'package:waslny_rider/constants.dart';
import 'package:waslny_rider/controllers/choose_map_location_controller.dart';

class ChooseLocationText extends StatelessWidget {
  String location;
  ChooseLocationText({super.key, required this.location});

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
              maxLines: 2,
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
                  hintText: location == '---' ? "اختر الموقع" : location,
                  hintStyle: TextStyle(
                    color: white,
                    fontFamily: 'cairo',
                    fontSize: 12,
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
              Get.delete<ChooseMapLocationController>();
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
