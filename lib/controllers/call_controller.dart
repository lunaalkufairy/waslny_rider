import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class CallController extends GetxController {
  // الرقم يلي بدك تتصل عليه
  var phoneNumber = "".obs;

  Future<void> makePhoneCall() async {
    if (phoneNumber.isEmpty) {
      Get.snackbar("خطأ", "الرجاء إدخال رقم الهاتف");
      return;
    }

    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber.value,
    );

    if (await canLaunchUrl(launchUri)) {
      await launchUrl(launchUri);
    } else {
      Get.snackbar("خطأ", "ما قدرت افتح تطبيق الاتصال");
    }
  }
}
