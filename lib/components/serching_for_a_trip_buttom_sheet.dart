import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/route_manager.dart';
import 'package:waslny_rider/components/multie_Trip_location_card.dart';
import 'package:waslny_rider/constants.dart';
import 'package:waslny_rider/screens/cacle_trip_screen.dart';

class SerchingForATripButtomSheet extends StatelessWidget {
  const SerchingForATripButtomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 560,
      width: double.infinity,
      decoration:
          BoxDecoration(color: black1, borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: [
          SizedBox(
            height: 15,
          ),
          Container(
            decoration: BoxDecoration(
                color: white, borderRadius: BorderRadius.circular(20)),
            height: 5,
            width: 120,
          ),
          SizedBox(
            height: 25,
          ),
          Text(
            " جاري البحث عن رحلة",
            style: TextStyle(
                color: white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: 'cairo'),
          ),
          SizedBox(
            height: 5,
          ),
          SvgPicture.asset(
            'assets/icons/Group 11264.svg',
            height: 180,
          ),
          SizedBox(
            height: 5,
          ),
          MultieTripLocationCard(addresses: [
            'مساكن برزة',
            ' برزة ',
            'مساكن برزة',
          ]),
          SizedBox(
            height: 25,
          ),
          GestureDetector(
            onTap: () {
              Get.to(CacleTripScreen());
            },
            child: Container(
              width: 280,
              height: 65,
              decoration: BoxDecoration(
                  color: black1,
                  border: Border.all(color: red),
                  borderRadius: BorderRadius.circular(25)),
              alignment: Alignment.center,
              child: Text(
                " الغاء الرحلة ",
                style: TextStyle(
                    color: red,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'cairo'),
              ),
            ),
          )
        ],
      ),
    );
  }
}
