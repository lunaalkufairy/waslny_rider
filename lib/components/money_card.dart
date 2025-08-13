import 'package:flutter/material.dart';
import 'package:waslny_rider/constants.dart';

class MoneyCard extends StatelessWidget {
  final int balance;

  const MoneyCard({
    Key? key,
    required this.balance,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      width: 350,
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [Color.fromARGB(255, 109, 109, 109), white],
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            child: GestureDetector(
              child: Icon(
                Icons.add,
                size: 40,
                color: black,
              ),
            ),
          ),
          Positioned(
            top: 1,
            right: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const SizedBox(height: 15),
                const Text(
                  "الرصيد الحالي",
                  style: TextStyle(
                      fontSize: 20,
                      color: white,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'cairo'),
                ),
                const SizedBox(height: 15),
                Row(
                  children: [
                    Text(
                      "ليرة سورية ",
                      style: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'cairo'),
                    ),
                    Text(
                      "$balance ",
                      style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'cairo'),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                Text(
                  balance > 100
                      ? "😉 ايييييييه تتهنى "
                      : "💸 ! محفظتك فارغة ساعدها تتنفس فلوس ",
                  style: TextStyle(
                      fontSize: 14, color: black, fontFamily: 'cairo'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
