import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:waslny_rider/components/Animate_Add_Order_Button.dart';
import 'package:waslny_rider/components/customaiz_trip_buttom_sheet.dart';
import 'package:waslny_rider/components/customaize_trip_button.dart';
import 'package:waslny_rider/components/googleMap.dart';
import 'package:waslny_rider/components/my_wallet_button.dart';
import 'package:waslny_rider/components/side_bar.dart';
import 'package:waslny_rider/components/side_bar_button.dart';
import 'package:waslny_rider/constants.dart';
import 'package:waslny_rider/controllers/home_screen_controller.dart';
import 'package:waslny_rider/screens/login_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HomeScreenController controller = Get.put(HomeScreenController());
    return Scaffold(
      key: controller.scaffoldKey,
      endDrawer: Drawer(
        // child: ListView(

        // ),
        child: SideBar(),
      ),
      backgroundColor: black,
      body: Stack(
        children: [
          MapComponent(isZoomAble: false, ismoveAble: false),
          Align(
            alignment: Alignment.bottomCenter,
            child: AnimateAddOrderButton(),
          ),
          Align(
            alignment: Alignment(0.88, -0.85),
            child: SideBarButton(
              onTap: () {
                controller.openDrawer();
              },
            ),
          ),
          Align(
            alignment: Alignment(-0.85, -0.88),
            child: MyWalletButton(
              onTap: () {},
            ),
          ),
          Align(
            alignment: Alignment(0.85, 0.80),
            child: CustomizeTripButton(
              onTap: () {
                Get.bottomSheet(CustomaizTripButtomSheet()
                    // enterBottomSheetDuration: Duration(milliseconds: 100),
                    );
              },
            ),
          ),
        ],
      ),
    );
  }
}
