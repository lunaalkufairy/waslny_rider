import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:waslny_rider/constants.dart';
import 'package:waslny_rider/controllers/get_user_information_screen_controller.dart';
import 'package:waslny_rider/controllers/otp_page_controller.dart';

class MoneyCodesController extends GetxController {
  OtpPageController get controller => Get.find<OtpPageController>();
  String? code;

  Future<void> checkCode() async {
    if (code == '') {
      Get.showSnackbar(GetSnackBar(
        animationDuration: Duration(seconds: 1),
        duration: Duration(seconds: 2),
        snackStyle: SnackStyle.GROUNDED,
        backgroundColor: red,
        snackPosition: SnackPosition.TOP,
        title: 'خطأ ',
        message: 'يرجى ادخال الكود',
      ));
    } else {
      update();
      Get.dialog(Center(
        child: CircularProgressIndicator(
          color: blue,
        ),
      ));
      var url = Uri.parse("$baseUrl/api/money-codes/rider/redeem");

      var response = await http.post(
        url,
        headers: {
          "Accept": "application/json",
          "Authorization": "Bearer ${controller.accessToken}",
        },
        body: {"code": code},
      );

      if (response.statusCode == 200) {
        var data = json.decode(response.body);

        print("Status: ${data['status']}");
        print("Message: ${data['message']}");

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
          message: 'تم ايداع المبلغ في محفظتك',
        ));
      } else {
        if (Get.isDialogOpen ?? false) {
          Get.back();
        }
        print("Error: ${response.body}");
        Get.showSnackbar(GetSnackBar(
          animationDuration: Duration(seconds: 1),
          duration: Duration(seconds: 2),
          snackStyle: SnackStyle.GROUNDED,
          backgroundColor: red,
          snackPosition: SnackPosition.TOP,
          title: 'خطأ ',
          message: 'يرجى ادخال كود صحيح ',
        ));
      }
    }
  }
}
