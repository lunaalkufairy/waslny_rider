import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waslny_rider/components/money_card.dart';
import 'package:waslny_rider/components/page_top.dart';
import 'package:waslny_rider/constants.dart';
import 'package:waslny_rider/controllers/get_user_information_screen_controller.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    GetUserInfoScreenController controller = Get.find();
    return Scaffold(
      backgroundColor: black,
      body: Column(
        children: [
          PageTop(pageName: "المحفظة", width: 65),
          SizedBox(
            height: 25,
          ),
          GetBuilder<GetUserInfoScreenController>(
            builder: (controller) {
              controller.getUserInfo();
              return MoneyCard(balance: controller.moneyBalance!);
            },
          )
        ],
      ),
    );
  }
}
