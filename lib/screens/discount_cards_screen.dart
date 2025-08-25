import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:waslny_rider/components/custom_adding_button.dart';
import 'package:waslny_rider/components/discount_card.dart';
import 'package:waslny_rider/components/page_top.dart';
import 'package:waslny_rider/constants.dart';
import 'package:waslny_rider/controllers/discount_screen_controller.dart';
import 'package:waslny_rider/screens/add_a_discount_card_screen.dart';

class DiscountCardsScreen extends StatefulWidget {
  const DiscountCardsScreen({super.key});

  @override
  State<DiscountCardsScreen> createState() => _DiscountCardsScreenState();
}

class _DiscountCardsScreenState extends State<DiscountCardsScreen> {
  late DiscountScreenController controller;

  @override
  void initState() {
    super.initState();
    controller = Get.put(DiscountScreenController());
    controller.getcopons(); // استدعاء أول ما تفتح الصفحة
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black1,
      body: GetBuilder<DiscountScreenController>(
        builder: (controller) {
          return SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  PageTop(pageName: 'رموز الخصم', width: 55),
                  const SizedBox(height: 30),
                  Align(
                    alignment: const Alignment(-0.98, 0.8),
                    child: CustomAddingButton(
                      onPressed: () {
                        Get.off(AddADiscountCardScreen());
                      },
                      backgroundColor: lightBlack,
                      addColor: white,
                    ),
                  ),
                  controller.isLoading
                      ? Column(
                          children: [
                            SizedBox(
                              height: 250,
                            ),
                            Center(
                              child: CircularProgressIndicator(color: blue),
                            ),
                          ],
                        )
                      : controller.discounts.isEmpty
                          ? Center(
                              child: Column(
                                children: [
                                  const SizedBox(height: 250),
                                  const Text(
                                    textDirection: TextDirection.rtl,
                                    "  قم بإضافة كود خصم وتمتع   \nبحسومات على رحلاتك القادمة ",
                                    style: TextStyle(
                                        color: white,
                                        fontSize: 18,
                                        fontFamily: 'cairo'),
                                  ),
                                  const SizedBox(height: 20),
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
                                padding: const EdgeInsets.only(top: 10),
                                itemCount: controller.discounts.length,
                                itemBuilder: (context, index) {
                                  final discount = controller.discounts[index];
                                  return GestureDetector(
                                    onTap: () {
                                      // Get.to(OrderInformationScreen());
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 2, horizontal: 2),
                                      child: DiscountCard(
                                        discountValue: discount.percent,
                                        validUntil: discount.endDate,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
