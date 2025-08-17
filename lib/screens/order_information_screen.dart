import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:waslny_rider/components/custom_arrow.dart';
import 'package:waslny_rider/components/googleMap.dart';
import 'package:waslny_rider/components/multie_Trip_location_card.dart';
import 'package:waslny_rider/components/trip_order_information_buttom_sheet.dart';
import 'package:waslny_rider/constants.dart';

class OrderInformationScreen extends StatelessWidget {
  const OrderInformationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black1,
      body: Stack(
        children: [
          MapComponent(isZoomAble: false, ismoveAble: false),
          Align(
            alignment: Alignment(-0.8, -0.87),
            child: MultieTripLocationCard(addresses: [
              '123 Main Street, City',
              '456 Elm Street, City,',
              '789 Oak Street, City,'
            ]),
          ),
          Align(
            alignment: Alignment(0.99, -0.87),
            child: CustomArrow(
                onPressed: () {
                  Get.back();
                },
                backgroundColor: white,
                arrowColor: lightBlack),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: DraggableScrollableSheet(
              maxChildSize: 0.55,
              minChildSize: 0.14,
              initialChildSize: 0.14,
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
                      child: TripOrderInformationButtomSheet(),
                    ));
              },
            ),
          )
        ],
      ),
    );
  }
}
