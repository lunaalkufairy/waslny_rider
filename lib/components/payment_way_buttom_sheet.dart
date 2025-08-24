import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waslny_rider/components/custom_Button.dart';
import 'package:waslny_rider/components/payment_way.dart';
import 'package:waslny_rider/components/select_price_trip_type.dart';
import 'package:waslny_rider/constants.dart';
import 'package:waslny_rider/controllers/add_trip_controller.dart';
import 'package:waslny_rider/screens/trip_map_screen.dart';

class PaymentWayButtomSheet extends StatelessWidget {
  const PaymentWayButtomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    AddTripController controller = Get.find();
    return Container(
      height: 380,
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
              " اختر طريقة الدفع",
              style: TextStyle(color: white, fontSize: 22, fontFamily: 'cairo'),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          PaymentWay(),
          SizedBox(
            height: 5,
          ),
          CustomButton(
              onTap: () {
                Get.to(TripMapScreen());
              },
              text: 'طلب الرحلة')
        ],
      ),
    );
  }
}
