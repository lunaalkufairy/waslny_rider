import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waslny_rider/components/custom_Button.dart';
import 'package:waslny_rider/components/payment_way.dart';
import 'package:waslny_rider/components/payment_way_buttom_sheet.dart';
import 'package:waslny_rider/components/select_price_trip_type.dart';
import 'package:waslny_rider/components/select_trip_type.dart';
import 'package:waslny_rider/constants.dart';
import 'package:waslny_rider/controllers/add_trip_controller.dart';

class SelectPriceTripButtomSheet extends StatelessWidget {
  const SelectPriceTripButtomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    AddTripController controller = Get.find();
    return Container(
      height: 450,
      width: double.infinity,
      decoration: BoxDecoration(
        color: black,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Container(
            decoration: BoxDecoration(
                color: white, borderRadius: BorderRadius.circular(20)),
            height: 5,
            width: 100,
          ),
          SizedBox(
            height: 40,
          ),
          Align(
            alignment: Alignment(0.85, 0),
            child: Text(
              " اختر مستوى الرحلة",
              style: TextStyle(color: white, fontSize: 22, fontFamily: 'cairo'),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          SelectPriceTripType(prices: ['', '', '']),
          SizedBox(
            height: 5,
          ),
          CustomButton(
              onTap: () {
                Get.back();
                Get.bottomSheet(PaymentWayButtomSheet());
              },
              text: 'متابعة')
        ],
      ),
    );
  }
}
