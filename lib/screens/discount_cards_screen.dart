import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';
import 'package:waslny_rider/components/custom_adding_button.dart';
import 'package:waslny_rider/components/discount_card.dart';
import 'package:waslny_rider/components/page_top.dart';
import 'package:waslny_rider/constants.dart';
import 'package:waslny_rider/controllers/discount_screen_controller.dart';
import 'package:waslny_rider/screens/add_a_discount_card_screen.dart';

class DiscountCardsScreen extends StatelessWidget {
  const DiscountCardsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    DiscountScreenController controller = Get.put(DiscountScreenController());

    return Scaffold(
      backgroundColor: black1,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              PageTop(pageName: 'رموز الخصم', width: 75),
              SizedBox(
                height: 30,
              ),
              Align(
                alignment: Alignment(-0.98, 0.8),
                child: CustomAddingButton(
                    onPressed: () {
                      Get.to(AddADiscountCardScreen());
                    },
                    backgroundColor: lightBlack,
                    addColor: white),
              ),
              controller.discounts.length == 0
                  ? Center(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 250,
                          ),
                          Text(
                            textDirection: TextDirection.rtl,
                            "  قم بإضافة كود خصم وتمتع   \nبحسومات على رحلاتك القادمة ",
                            style: TextStyle(
                                color: white,
                                fontSize: 18,
                                fontFamily: 'cairo'),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          SvgPicture.asset(
                            'assets/icons/Discounts.svg',
                            height: 70,
                          ),
                        ],
                      ),
                    )
                  : SizedBox(
                      height: 753,
                      width: double.infinity,
                      child: ListView.builder(
                        padding: EdgeInsets.only(top: 10),
                        itemCount: controller.discounts.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              // Get.to(OrderInformationScreen());
                            },
                            child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 2, left: 2, right: 2),
                                child: DiscountCard(
                                    discountValue: 5, validUntil: '30/9/2004')),
                          );
                        },
                      ),
                    )
            ],
          ),
        ),
      ),
    );
  }
}
