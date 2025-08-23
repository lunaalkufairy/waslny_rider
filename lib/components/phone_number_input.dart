import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:waslny_rider/constants.dart';
import 'package:waslny_rider/controllers/login_screen_controller.dart';

class PhoneNumberInput extends StatelessWidget {
  const PhoneNumberInput({super.key});

  @override
  Widget build(BuildContext context) {
    LoginScreenController controller = Get.find();
    return Padding(
      padding: const EdgeInsets.all(13.0),
      child: IntlPhoneField(
        flagsButtonMargin: EdgeInsets.all(8),
        showCountryFlag: true,
        cursorHeight: 30,
        cursorColor: blue,
        decoration: InputDecoration(
          hintText: "09*********",
          hintStyle: TextStyle(color: white),
          filled: true,
          fillColor: black,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: Color(0xFF413D48), width: 1),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: Color(0xFF413D48), width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: Color(0xFF413D48), width: 2),
          ),
        ),
        initialCountryCode: 'SY',
        dropdownTextStyle: TextStyle(color: white),
        style: TextStyle(color: white),
        onChanged: (phone) {
          controller.phoneNumber =
              phone.completeNumber.toString().substring(1, 4) +
                  phone.completeNumber.toString().substring(5);

          print(phone.completeNumber.toString().substring(1, 4) +
              phone.completeNumber.toString().substring(5));
        },
        dropdownIconPosition: IconPosition.trailing,
        dropdownIcon: const Icon(
          Icons.arrow_drop_down,
          color: white,
        ),
        dropdownDecoration: const BoxDecoration(
          border: Border(
            right: BorderSide(
              color: white,
              width: 1,
            ),
          ),
        ),
      ),
    );
  }
}
