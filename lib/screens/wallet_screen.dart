import 'package:flutter/material.dart';
import 'package:waslny_rider/components/money_card.dart';
import 'package:waslny_rider/components/page_top.dart';
import 'package:waslny_rider/constants.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      body: Column(
        children: [
          PageTop(pageName: "المحفظة", width: 65),
          SizedBox(
            height: 25,
          ),
          MoneyCard(balance: 200)
        ],
      ),
    );
  }
}
