import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waslny_rider/components/googleMap.dart';
import 'package:waslny_rider/components/my_wallet_button.dart';
import 'package:waslny_rider/components/serching_for_a_trip_buttom_sheet.dart';
import 'package:waslny_rider/components/side_bar.dart';
import 'package:waslny_rider/components/side_bar_button.dart';
import 'package:waslny_rider/components/trip_order_information_buttom_sheet.dart';
import 'package:waslny_rider/constants.dart';
import 'package:waslny_rider/controllers/home_screen_controller.dart';
import 'package:waslny_rider/screens/wallet_screen.dart';

class TripMapScreen extends StatelessWidget {
  const TripMapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HomeScreenController controller = Get.put(HomeScreenController());

    return Scaffold(
      key: controller.scaffoldKey,
      endDrawer: Drawer(
        child: SideBar(),
      ),
      backgroundColor: black,
      body: Stack(
        children: [
          MapComponent(isZoomAble: false, ismoveAble: false),
          Align(
            alignment: Alignment.bottomCenter,
            child: DraggableScrollableSheet(
              maxChildSize: 0.65,
              minChildSize: 0.14,
              initialChildSize: 0.65,
              builder: (context, scrollController) {
                return Container(
                    decoration: BoxDecoration(
                      color: black,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    child: SingleChildScrollView(
                      controller: scrollController,
                      child: SerchingForATripButtomSheet(),
                    ));
              },
            ),
          )
        ],
      ),
    );
  }
}
