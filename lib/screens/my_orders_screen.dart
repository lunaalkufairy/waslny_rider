import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:waslny_rider/components/multie_Trip_location_card.dart';
import 'package:waslny_rider/components/my_orders_trip_info_card.dart';
import 'package:waslny_rider/components/page_top.dart';
import 'package:waslny_rider/constants.dart';
import 'package:waslny_rider/controllers/my_orders_screen_controller.dart';
// import 'package:waslny_rider/screens/order_information_screen.dart';

class MyOrdersScreen extends StatelessWidget {
  const MyOrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    MyOrdersScreenController controller = Get.put(MyOrdersScreenController());
    return Scaffold(
      backgroundColor: black1,
      body: Column(
        children: [
          PageTop(pageName: "طلباتي", width: 80),
          controller.orders == null
              ? Center(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 250,
                      ),
                      Text(
                        "اطلب توصيلة الأن",
                        style: TextStyle(
                            color: white, fontSize: 18, fontFamily: 'cairo'),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      SvgPicture.asset(
                        "assets/icons/Routing 4.svg",
                        height: 70,
                      )
                    ],
                  ),
                )
              : Container(
                  height: 753,
                  width: double.infinity,
                  child: ListView.builder(
                    itemCount: controller.orders!.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          // Get.to(OrderInformationScreen());
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: MyOrdersTripInfo(
                              addresses: ["add", "add", "add"],
                              price: "555",
                              distance: "lllll"),
                        ),
                      );
                    },
                  ),
                )
        ],
      ),
    );
  }
}
