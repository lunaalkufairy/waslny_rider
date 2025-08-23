import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:waslny_rider/constants.dart';
import 'package:waslny_rider/controllers/otp_page_controller.dart';

class GetUserInfoScreenController extends GetxController {
  OtpPageController get controller => Get.find<OtpPageController>();

  String? firstName;
  String? lasttName;
  String? number;
  String? message;
  String? moneyBalance;
  String? firstNameUpdate;
  String? lastNameUpdate;

  Future<void> getUserInfo() async {
    final url = Uri.parse("$baseUrl/api/rider/profile");

    final response = await http.get(
      url,
      headers: {
        "Accept": "application/json",
        "Authorization": "Bearer ${controller.accessToken}",
      },
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      var data = json.decode(response.body);
      message = data["message"];
      firstName = data['data']["first_name"];
      lasttName = data['data']["last_name"];
      number = data['data']["phone"];
      moneyBalance = data['data']["wallet"]["balance"];
      update();
    } else {
      var data = json.decode(response.body);
      message = data["message"];
      print("Error: ${response.statusCode} - ${response.body}");
      update();
    }
  }

  Future<void> ubdateUserInfo() async {
    print(controller.accessToken);
    if (firstNameUpdate == '' && lastNameUpdate == '') {
      Get.showSnackbar(GetSnackBar(
        animationDuration: Duration(seconds: 1),
        duration: Duration(seconds: 2),
        snackStyle: SnackStyle.GROUNDED,
        backgroundColor: red,
        snackPosition: SnackPosition.TOP,
        title: 'Error',
        message: 'Nothing to update',
      ));
    } else if (firstNameUpdate == '' && lastNameUpdate != '') {
      Get.dialog(Center(
        child: CircularProgressIndicator(
          color: blue,
        ),
      ));

      var url = Uri.parse("$baseUrl/api/rider/profile/update");

      var response = await http.post(
        url,
        headers: {
          "Accept": "application/json",
          "Authorization": "Bearer ${controller.accessToken}",
        },
        body: {
          "last_name": lastNameUpdate,
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

        Get.back();
        Get.showSnackbar(GetSnackBar(
          animationDuration: Duration(seconds: 1),
          duration: Duration(seconds: 2),
          snackStyle: SnackStyle.GROUNDED,
          backgroundColor: blue,
          snackPosition: SnackPosition.TOP,
          title: 'تمت العملية بنجاح',
          message: 'تم تعديل الكنية',
        ));
      } else {
        var data = json.decode(response.body);
        print("Error: ${response.statusCode}");
        print('${data['message']}');
      }
    } else if (firstNameUpdate != '' && lastNameUpdate == '') {
      Get.dialog(Center(
        child: CircularProgressIndicator(
          color: blue,
        ),
      ));

      var url = Uri.parse("$baseUrl/api/rider/profile/update");

      var response = await http.post(
        url,
        headers: {
          "Accept": "application/json",
          "Authorization": "Bearer ${controller.accessToken}",
        },
        body: {
          "first_name": firstNameUpdate,
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

        Get.back();
        Get.showSnackbar(GetSnackBar(
          animationDuration: Duration(seconds: 1),
          duration: Duration(seconds: 2),
          snackStyle: SnackStyle.GROUNDED,
          backgroundColor: blue,
          snackPosition: SnackPosition.TOP,
          title: 'تمت العملية بنجاح',
          message: 'تم تعديل الاسم ',
        ));
      } else {
        var data = json.decode(response.body);
        print("Error: ${response.statusCode}");
        print('${data['message']}');
      }
    } else if (firstNameUpdate != '' && lastNameUpdate != '') {
      Get.dialog(Center(
        child: CircularProgressIndicator(
          color: blue,
        ),
      ));

      var url = Uri.parse("$baseUrl/api/rider/profile/update");

      var response = await http.post(
        url,
        headers: {
          "Accept": "application/json",
          "Authorization": "Bearer ${controller.accessToken}",
        },
        body: {
          "first_name": firstNameUpdate,
          "last_name": lastNameUpdate,
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

        Get.back();
        Get.showSnackbar(GetSnackBar(
          animationDuration: Duration(seconds: 1),
          duration: Duration(seconds: 2),
          snackStyle: SnackStyle.GROUNDED,
          backgroundColor: blue,
          snackPosition: SnackPosition.TOP,
          title: 'تمت العملية بنجاح',
          message: 'تم تعديل الاسم والكنية',
        ));
      } else {
        var data = json.decode(response.body);
        print("Error: ${response.statusCode}");
        print('${data['message']}');
      }
    }
  }
}
