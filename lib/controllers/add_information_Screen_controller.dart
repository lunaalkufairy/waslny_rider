import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waslny_rider/constants.dart';
import 'package:waslny_rider/controllers/otp_page_controller.dart';
import 'package:waslny_rider/screens/home_screen.dart';
import 'package:waslny_rider/screens/otp_screen.dart';

class AddInformationScreenController extends GetxController {
  OtpPageController controller = Get.find();
  String? firstName;
  String? secondName;
  String? location;

  Future<void> checkValues() async {
    print(controller.accessToken);
    if (firstName == '' || secondName == '') {
      Get.showSnackbar(GetSnackBar(
        animationDuration: Duration(seconds: 1),
        duration: Duration(seconds: 2),
        snackStyle: SnackStyle.GROUNDED,
        backgroundColor: red,
        snackPosition: SnackPosition.TOP,
        title: 'Error',
        message: 'Please fill all the fields',
      ));
      print("Please fill all the fields");
    } else {
      print("All fields are filled");
      Get.dialog(Center(
        child: CircularProgressIndicator(
          color: blue,
        ),
      ));

      var url = Uri.parse("$baseUrl/api/rider/profile/completion");

      var response = await http.post(
        url,
        headers: {
          "Accept": "application/json",
          "Authorization": "Bearer ${controller.accessToken}",
        },
        body: {
          "first_name": firstName,
          "last_name": secondName,
          "location": location == '' ? "سوريا" : location
        },
      );

      if (Get.isDialogOpen ?? false) {
        Get.back();
      }

      if (response.statusCode == 200) {
        var data = json.decode(response.body);

        print("Status: ${data['status']}");
        print("Message: ${data['message']}");
        print("Requires OTP: ${data['data']['first_name']}");
        print("Requires OTP: ${data['data']['last_name']}");
        print("Requires OTP: ${data['data']['phone']}");
        if (Get.isDialogOpen ?? false) {
          Get.back();
        }

        Get.off(HomeScreen());
      } else {
        var data = json.decode(response.body);
        print("Error: ${response.statusCode}");
        print('${data['message']}');
      }
    }
  }
}
