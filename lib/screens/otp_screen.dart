import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:get/route_manager.dart';
import 'package:waslny_rider/components/OTP_textField.dart';
import 'package:waslny_rider/components/custom_Button.dart';
import 'package:waslny_rider/constants.dart';
import 'package:waslny_rider/screens/add_information_screen.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String number = '0930474954';
    return Scaffold(
      backgroundColor: black,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(right: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(
                height: 100,
              ),
              Text(
                "الرجاء ادخال الرمز الذي تم إرساله ",
                style:
                    TextStyle(color: white, fontSize: 22, fontFamily: 'cairo'),
              ),
              SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "$number",
                      style: TextStyle(
                          color: blue, fontSize: 22, fontFamily: 'cairo'),
                    ),
                    SizedBox(
                      width: 7,
                    ),
                    Text(
                      ": للرقم",
                      style: TextStyle(
                          color: white, fontSize: 22, fontFamily: 'cairo'),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 50,
              ),
              OtpTextfield(),
              SizedBox(
                height: 40,
              ),
              CustomButton(
                onTap: () {
                  Get.to(AddInformationScreen());
                },
                text: "تأكيد",
                isEnabled: true,
              )
            ],
          ),
        ),
      ),
    );
  }
}
