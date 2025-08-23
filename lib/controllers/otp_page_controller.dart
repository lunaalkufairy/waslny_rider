import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:waslny_rider/constants.dart';
import 'package:waslny_rider/controllers/get_user_information_screen_controller.dart';
import 'package:waslny_rider/controllers/login_screen_controller.dart';
import 'package:waslny_rider/screens/add_information_screen.dart';
import 'package:waslny_rider/screens/home_screen.dart';

class OtpPageController extends GetxController {
  GetUserInfoScreenController userInfoScreenController =
      Get.put(GetUserInfoScreenController());
  LoginScreenController controller = Get.find();

  int? statusResponse;
  String? validator;
  String? accessToken;

  void resetValidator() {
    validator = null;
    update();
  }

  Future<void> otpCheck(String pin) async {
    Get.dialog(
      const Center(
          child: CircularProgressIndicator(
        color: blue,
      )),
      barrierDismissible: false,
    );

    var url = Uri.parse("$baseUrl/api/rider/otp/verify");

    var response = await http.post(
      url,
      headers: {"Accept": "application/json"},
      body: {
        "phone": controller.phoneNumber,
        "otp": pin,
      },
    );

    statusResponse = response.statusCode;

    if (response.statusCode == 200 || response.statusCode == 201) {
      var data = json.decode(response.body);
      validator = null;
      accessToken = data['data']['token'];
      print(accessToken);
      update();
      print('qqqqqqqqqqqqqqq');
      await userInfoScreenController.getUserInfo();
      if (Get.isDialogOpen ?? false) {
        Get.back();
      }
      print(userInfoScreenController.message);
      if (userInfoScreenController.message == 'rider profile is incomplete') {
        print('EEEEEEEEEEEEEEEEEEEEEEEEEEEE');

        Get.off(() => AddInformationScreen());
      } else if (userInfoScreenController.message ==
          'Rider account retrieved successfully') {
        print('QQQQQQQQQQQQQQQQQQQQQQQQ');
        Get.off(() => HomeScreen());
      }
    } else if (response.statusCode == 403) {
      if (Get.isDialogOpen ?? false) {
        Get.back();
      }
      validator = "Pin is incorrect";
      update();
    }
  }
}
