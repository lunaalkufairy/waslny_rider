import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/instance_manager.dart';
import 'package:waslny_rider/constants.dart';
import 'package:waslny_rider/controllers/add_trip_controller.dart';

class SelectDurationTripType extends StatefulWidget {
  const SelectDurationTripType({super.key});

  @override
  State<SelectDurationTripType> createState() => _SelectDurationTripTypeState();
}

class _SelectDurationTripTypeState extends State<SelectDurationTripType> {
  int? selectedIndex;

  final List<Map<String, String>> options = [
    {"title": "فورية", "icon": "assets/icons/Bolt.svg"},
    {"title": "مجدولة", "icon": "assets/icons/Clock Circle.svg"},
  ];

  @override
  Widget build(BuildContext context) {
    AddTripController controller = Get.find();
    return Center(
      child: Wrap(
        spacing: 12,
        runSpacing: 12,
        children: List.generate(options.length, (index) {
          final isSelected = selectedIndex == index;
          return GestureDetector(
            onTap: () {
              setState(() {
                controller.selectedIndex = index;
                selectedIndex = index;

                print(options[index]["title"]);
              });
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: 173,
              height: 120,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: isSelected ? blue : black,
                border: Border.all(color: blue, width: 1.5),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SvgPicture.asset(
                    options[index]["icon"]!,
                    height: 30,
                  ),
                  const SizedBox(height: 5),
                  Text(
                    options[index]["title"]!,
                    style: TextStyle(
                      color: white,
                      fontSize: 16,
                      fontFamily: 'Cairo',
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 6),
                  Text(
                    "قم بالرحلة الآن",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                      fontFamily: 'Cairo',
                    ),
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
