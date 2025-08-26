import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:waslny_rider/controllers/baindings.dart';
import 'package:waslny_rider/screens/login_screen.dart';

void main() {
  runApp(const WaslnyRider());
}

class WaslnyRider extends StatelessWidget {
  const WaslnyRider({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        initialBinding: Baindings(),
        debugShowCheckedModeBanner: false,
        home: LoginScreen()
        // RouteMapWidget(
        //   points: [
        //     LatLng(33.5138, 36.2765), // دمشق
        //     LatLng(33.5200, 36.2900),
        //     LatLng(33.5250, 36.2800), // نقطة ثالثة
        //   ],
        //   markerIconPaths: [
        //     "assets/icons/ic_dest.png",
        //     "assets/icons/ic_dest.png",
        //     "assets/icons/CurrentLocationMarker.png",
        //   ],
        // ),
        );
  }
}
