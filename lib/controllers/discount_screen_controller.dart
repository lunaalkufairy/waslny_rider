import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waslny_rider/constants.dart';
import 'package:waslny_rider/controllers/otp_page_controller.dart';
import 'package:waslny_rider/models/discount_card_model.dart';

class DiscountScreenController extends GetxController {
  OtpPageController get controller => Get.find<OtpPageController>();
  List<Discount> discounts = [];
  String? copon;
  bool isLoading = false;

  Future<void> checkCopon() async {
    if (copon == '') {
      Get.showSnackbar(GetSnackBar(
        animationDuration: Duration(seconds: 1),
        duration: Duration(seconds: 2),
        snackStyle: SnackStyle.GROUNDED,
        backgroundColor: red,
        snackPosition: SnackPosition.TOP,
        title: 'خطأ ',
        message: 'يرجى ادخال الرمز',
      ));
    } else {
      update();
      Get.dialog(Center(
        child: CircularProgressIndicator(
          color: blue,
        ),
      ));
      var url = Uri.parse("$baseUrl/api/coupons/rider/${copon}");

      var response = await http.post(
        url,
        headers: {
          "Accept": "application/json",
          "Authorization": "Bearer ${controller.accessToken}",
        },
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        var data = json.decode(response.body);

        print("Status: ${data['status']}");
        print("Message: ${data['message']}");
        print("Message: ${data['data']}");

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
          message: 'تم إضافة رمز الخصم بنجاح',
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
          message: 'يرجى ادخال رمز صحيح ',
        ));
      }
    }
  }

  Future<void> getcopons() async {
    isLoading = true;
    update();

    final url = Uri.parse("$baseUrl/api/coupons/rider?per_page=10");

    final response = await http.get(
      url,
      headers: {
        "Accept": "application/json",
        "Authorization": "Bearer ${controller.accessToken}",
      },
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      var data = json.decode(response.body);

      discounts = (data['data'] as List)
          .map((item) => Discount.fromJson(item))
          .toList();
    } else {
      print("Error: ${response.statusCode} - ${response.body}");
    }

    isLoading = false;
    update();
  }
}
