import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:waslny_rider/constants.dart';

class SelectPriceTripType extends StatefulWidget {
  List<String> prices;
  SelectPriceTripType({Key? key, required this.prices}) : super(key: key);

  @override
  State<SelectPriceTripType> createState() =>
      _SelectPriceTripTypeState(prices: prices);
}

class _SelectPriceTripTypeState extends State<SelectPriceTripType> {
  List<String> prices;
  _SelectPriceTripTypeState({required this.prices});
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: List.generate(3, (index) {
          String title = ['اقتصادية', 'متميزة', 'عائلية'][index];
          String price = prices[index];
          int passengers = [4, 4, 8][index];
          String iconPath = [
            'assets/icons/Property 1=standard.svg',
            'assets/icons/Property 1=premium.svg',
            'assets/icons/Property 1=suv.svg',
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
                  Row(
                    children: [
                      Text(
                        '$passengers',
                        style: const TextStyle(
                            color: white, fontSize: 14, fontFamily: 'cairo'),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      SvgPicture.asset('assets/icons/userIcon.svg'),
                    ],
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'ل.س',
                    style: const TextStyle(
                      color: white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'cairo',
                    ),
                  ),
                  Text(
                    '$price',
                    style: const TextStyle(
                      color: white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'cairo',
                    ),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Text(
                    title,
                    style: const TextStyle(
                        color: white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'cairo'),
                  ),
                  SvgPicture.asset(
                    iconPath,
                    width: 40,
                    height: 40,
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
