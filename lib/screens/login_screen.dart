import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:get/state_manager.dart';
import 'package:waslny_rider/components/custom_Button.dart';
import 'package:waslny_rider/components/phone_number_input.dart';
import 'package:waslny_rider/constants.dart';
import 'package:waslny_rider/controllers/login_screen_controller.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    LoginScreenController controller = Get.find();

    return Scaffold(
      backgroundColor: black,
      body: Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 200,
              ),
              SvgPicture.asset('assets/icons/Group 34.svg'),
              SizedBox(
                height: 10,
              ),
              Text(
                'تسجيل الدخول',
                style:
                    TextStyle(color: white, fontSize: 25, fontFamily: 'cairo'),
              ),
              SizedBox(
                height: 30,
              ),
              PhoneNumberInput(),
              SizedBox(
                height: 10,
              ),
              CustomButton(
                  onTap: () async {
                    await controller.sendPhone();
                    if (controller.t) {
                      controller.showExtrnalDialog();
                    }
                  },
                  text: 'طلب رمز')
            ],
          ),
        ),
      ),
    );
  }
}
