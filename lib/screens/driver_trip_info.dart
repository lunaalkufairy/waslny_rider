import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:waslny_rider/components/multie_Trip_location_card.dart';
import 'package:waslny_rider/constants.dart';
import 'package:waslny_rider/controllers/call_controller.dart';
import 'package:waslny_rider/controllers/login_screen_controller.dart';
import 'package:waslny_rider/screens/cacle_trip_screen.dart';
import 'package:waslny_rider/screens/login_screen.dart';

class DriverTripInfo extends StatelessWidget {
  const DriverTripInfo({super.key});

  @override
  Widget build(BuildContext context) {
    LoginScreenController controller = Get.find();
    CallController callController = Get.put(CallController());
    return Container(
      height: 452,
      width: double.infinity,
      decoration: BoxDecoration(
          color: black1,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30))),
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
            height: 15,
          ),
          Container(
            width: 370,
            height: 80,
            decoration: BoxDecoration(
                color: lightBlack, borderRadius: BorderRadius.circular(20)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                    callController.phoneNumber = controller.phoneNumber!.obs;
                    callController.makePhoneCall();
                  },
                  child: SvgPicture.asset(
                    'assets/icons/Frame 11394.svg',
                    width: 50,
                  ),
                ),
                SizedBox(width: 62),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 150,
                      alignment: Alignment.centerRight,
                      child: Text(
                        "محمد نور",
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'cairo'),
                      ),
                    ),
                    Text(
                      "السائق",
                      style: TextStyle(
                          fontSize: 12,
                          color: lightGrey,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'cairo'),
                    ),
                  ],
                ),
                SizedBox(width: 8),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 22,
                    ),
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.yellow, size: 18),
                        Text(
                          "5",
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'cairo'),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(width: 18),
              ],
            ),
          ),
          SizedBox(height: 18),
          Align(
              alignment: Alignment(0.9, 0),
              child: MultieTripLocationCard(addresses: ['', '', ''])),
          SizedBox(height: 18),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                width: 200,
                height: 50,
                decoration: BoxDecoration(
                    color: white, borderRadius: BorderRadius.circular(20)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "طريقة الدفع",
                          style: TextStyle(
                              fontSize: 15,
                              color: black,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'cairo'),
                        ),
                        Text(
                          "نقدي",
                          style: TextStyle(
                              fontSize: 12,
                              color: black,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'cairo'),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(shape: BoxShape.circle),
                      child: SvgPicture.asset(
                        'assets/icons/state=cash.svg',
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                  ],
                ),
              ),
              Container(
                width: 80,
                height: 50,
                decoration: BoxDecoration(
                    color: white, borderRadius: BorderRadius.circular(20)),
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Text(
                    "525",
                    style: TextStyle(
                        fontSize: 21,
                        color: green,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'cairo'),
                  ),
                  Icon(
                    Icons.attach_money_outlined,
                    color: green,
                    size: 35,
                  )
                ]),
              )
            ],
          ),
          SizedBox(
            height: 20,
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
