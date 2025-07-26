import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:waslny_rider/constants.dart';

class PaymentWay extends StatefulWidget {
  PaymentWay({
    Key? key,
  }) : super(key: key);

  @override
  State<PaymentWay> createState() => _PaymentWayState();
}

class _PaymentWayState extends State<PaymentWay> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: List.generate(2, (index) {
          String title = ['نقدي', 'محفظتي'][index];

          int passengers = [4, 4, 8][index];
          String iconPath = [
            'assets/icons/state=cash.svg',
            'assets/icons/Wallet.svg',
          ][index];

          bool isSelected = selectedIndex == index;

          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
                print(title);
              });
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              margin: const EdgeInsets.symmetric(vertical: 6),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                  color: isSelected ? blue : black,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: blue)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.arrow_back_ios_new,
                    color: white,
                    size: 15,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Row(
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                            color: white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'cairo'),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        height: 45,
                        width: 45,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: white,
                        ),
                        alignment: Alignment.center,
                        child: SvgPicture.asset(
                          iconPath,
                          color: iconPath == 'assets/icons/state=cash.svg'
                              ? null
                              : black,
                          height: iconPath == 'assets/icons/state=cash.svg'
                              ? 20
                              : 30,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
