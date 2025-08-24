import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:waslny_rider/controllers/baindings.dart';
import 'package:waslny_rider/screens/choose_location_map.dart';
import 'package:waslny_rider/screens/home_screen.dart';
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
      home: LoginScreen(),
    );
  }
}
