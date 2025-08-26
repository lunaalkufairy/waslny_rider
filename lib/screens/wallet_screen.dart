import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waslny_rider/components/money_card.dart';
import 'package:waslny_rider/components/page_top.dart';
import 'package:waslny_rider/constants.dart';
import 'package:waslny_rider/controllers/get_user_information_screen_controller.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({super.key});

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  @override
  void initState() {
    GetUserInfoScreenController controller = Get.find();
    controller.getUserInfo();
    super.initState();
  }

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
              return controller.isLoading == true
                  ? Column(
                      children: [
                        SizedBox(
                          height: 300,
                        ),
                        Center(
                          child: CircularProgressIndicator(
                            color: blue,
                          ),
                        ),
                      ],
                    )
                  : MoneyCard(balance: controller.moneyBalance!);
            },
          )
        ],
      ),
    );
  }
}
