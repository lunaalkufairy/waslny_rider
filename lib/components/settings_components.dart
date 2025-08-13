import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';
import 'package:waslny_rider/constants.dart';
import 'package:waslny_rider/screens/shorot_ahkam_screen.dart';

class SettingsComponents extends StatelessWidget {
  const SettingsComponents({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: List.generate(4, (index) {
          String title = [
            'الإشعارات',
            'الشروط والأحكام',
            'سياسة الخصوصية',
            'حذف الحساب'
          ][index];

          String iconPath = [
            'assets/icons/Settings Icons.svg',
            'assets/icons/Property 1=Document.svg',
            'assets/icons/Property 1=File.svg',
            'assets/icons/Property 1=Delete.svg',
          ][index];

          return GestureDetector(
            onTap: () {
              if (index == 0) {}
              if (index == 1) {
                Get.to(ShorotAhkamScreen());
              }
              if (index == 2) {
                // Get.to();
              }
              if (index == 3) {}
            },
            child: Container(
              margin: index == 1
                  ? const EdgeInsets.only(top: 6, bottom: 0)
                  : index == 2
                      ? const EdgeInsets.only(top: 0, bottom: 6)
                      : const EdgeInsets.only(top: 6, bottom: 6),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: lightBlack,
                borderRadius: index == 1
                    ? BorderRadius.only(
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16))
                    : index == 2
                        ? BorderRadius.only(
                            bottomLeft: Radius.circular(16),
                            bottomRight: Radius.circular(16))
                        : BorderRadius.circular(16),
              ),
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
                        height: 35,
                        width: 35,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: black,
                        ),
                        alignment: Alignment.center,
                        child: SvgPicture.asset(
                          iconPath,
                          color:
                              iconPath == 'assets/icons/Property 1=Delete.svg'
                                  ? red
                                  : white,
                          height: 20,
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
