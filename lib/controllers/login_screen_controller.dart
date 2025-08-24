import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
import 'package:waslny_rider/constants.dart';
import 'package:waslny_rider/screens/otp_screen.dart';

class LoginScreenController extends GetxController {
  String? phoneNumber;
  bool t = true;

  Future<void> sendPhone() async {
    if (phoneNumber.toString().length == 12 &&
        phoneNumber.toString().startsWith('9639')) {
      t = true;
      update();
      Get.dialog(Center(
        child: CircularProgressIndicator(
          color: blue,
        ),
      ));
      var url = Uri.parse("$baseUrl/api/rider/login");

      var response = await http.post(
        url,
        headers: {
          "Accept": "application/json",
        },
        body: {
          "phone": phoneNumber.toString(),
        },
      );

      if (response.statusCode == 200) {
        var data = json.decode(response.body);

        print("Status: ${data['status']}");
        print("Message: ${data['message']}");
        print("Requires OTP: ${data['data']['requires_otp']}");
        if (Get.isDialogOpen ?? false) {
          Get.back();
        }

        Get.to(OtpScreen());
      } else {
        print("Error: ${response.body}");
      }
    } else {
      t = false;
      update();
      Get.showSnackbar(GetSnackBar(
        animationDuration: Duration(seconds: 1),
        duration: Duration(seconds: 2),
        snackStyle: SnackStyle.GROUNDED,
        backgroundColor: red,
        snackPosition: SnackPosition.TOP,
        title: 'Error',
        message: 'Enter A valid Number',
      ));
    }
  }

  void openTelegramBot() async {
    final url = Uri.parse("https://t.me/waslny_company_bot");

    try {
      final launched = await launchUrl(url, mode: LaunchMode.platformDefault);
      if (!launched) {
        Get.snackbar(
          "Error",
          "Cannot open Telegram",
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
      Get.snackbar(
        "Error",
        "Cannot open Telegram",
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void showExtrnalDialog() {
    Get.dialog(
      Dialog(
        backgroundColor: black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Container(
          height: 250,
          width: 400,
          decoration: BoxDecoration(
              border: Border.all(color: white),
              borderRadius: BorderRadius.circular(25)),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  "تم إرسال الرمز",
                  style: TextStyle(
                      fontSize: 18, fontFamily: 'cairo', color: white),
                ),
                const SizedBox(height: 40),
                const Text(
                  "سيتم نقلك الى تيليغرام للحصول على الرمز",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 17, fontFamily: 'cairo', color: white),
                ),
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: Container(
                          width: 100,
                          height: 40,
                          decoration: BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            "إلغاء",
                            style: TextStyle(
                                fontSize: 19,
                                fontFamily: 'cairo',
                                color: black),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      GestureDetector(
                        onTap: () {
                          Get.back();
                          openTelegramBot();
                        },
                        child: Container(
                          width: 100,
                          height: 40,
                          decoration: BoxDecoration(
                            color: blue,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            "موافق",
                            style: TextStyle(
                                fontSize: 19,
                                fontFamily: 'cairo',
                                color: white),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      barrierDismissible: true,
    );
  }
}
