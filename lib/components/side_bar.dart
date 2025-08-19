import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:waslny_rider/constants.dart';
import 'package:waslny_rider/screens/discount_cards_screen.dart';
import 'package:waslny_rider/screens/my_locations_screen.dart';
import 'package:waslny_rider/screens/my_orders_screen.dart';
import 'package:waslny_rider/screens/setting_screen.dart';
import 'package:waslny_rider/screens/view_iformation_screen.dart';
import 'package:waslny_rider/screens/wallet_screen.dart';

class SideBar extends StatelessWidget {
  const SideBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: black1,
      child: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 17),
            ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "الملف الشخصي",
                    style: TextStyle(
                        color: white, fontSize: 20, fontFamily: 'cairo'),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  SvgPicture.asset(
                    'assets/icons/User.svg',
                    height: 27,
                  )
                ],
              ),
              onTap: () {
                Get.to(ViewIformationScreen());
              },
            ),
            ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "المحفظة",
                    style: TextStyle(
                        color: white, fontSize: 20, fontFamily: 'cairo'),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  SvgPicture.asset(
                    'assets/icons/Wallet.svg',
                    height: 27,
                  )
                ],
              ),
              onTap: () {
                Get.to(WalletScreen());
              },
            ),
            ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "طلباتي",
                    style: TextStyle(
                        color: white, fontSize: 20, fontFamily: 'cairo'),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  SvgPicture.asset(
                    'assets/icons/Orders.svg',
                    height: 27,
                  )
                ],
              ),
              onTap: () {
                Get.to(MyOrdersScreen());
              },
            ),
            ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "عناويني",
                    style: TextStyle(
                        color: white, fontSize: 20, fontFamily: 'cairo'),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  SvgPicture.asset(
                    'assets/icons/Locations.svg',
                    height: 27,
                  )
                ],
              ),
              onTap: () {
                Get.to(MyLocationsScreen());
              },
            ),
            ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "رموز الخصم",
                    style: TextStyle(
                        color: white, fontSize: 20, fontFamily: 'cairo'),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  SvgPicture.asset(
                    'assets/icons/Discounts.svg',
                    height: 27,
                  )
                ],
              ),
              onTap: () {
                Get.to(DiscountCardsScreen());
              },
            ),
            ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "الإعدادات",
                    style: TextStyle(
                        color: white, fontSize: 20, fontFamily: 'cairo'),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  SvgPicture.asset(
                    'assets/icons/Settings.svg',
                    height: 27,
                  )
                ],
              ),
              onTap: () {
                Get.to(SettingScreen());
              },
            ),
          ],
        ),
      ),
    );
  }
}
