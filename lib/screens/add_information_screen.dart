import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:waslny_rider/components/custom_Button.dart';
import 'package:waslny_rider/components/custom_textField.dart';
import 'package:waslny_rider/constants.dart';
import 'package:waslny_rider/screens/home_screen.dart';

class AddInformationScreen extends StatelessWidget {
  const AddInformationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Text(
                  "إكمال المعلومات الشخصية",
                  style: TextStyle(
                      color: white, fontSize: 26, fontFamily: 'cairo'),
                ),
                SizedBox(
                  height: 50,
                ),
                CustomTextfield(
                  textFieldName: "الاسم",
                  hintText: 'الاسم',
                ),
                SizedBox(
                  height: 25,
                ),
                CustomTextfield(
                  textFieldName: "الكنية",
                  hintText: 'الكنية',
                ),
                SizedBox(
                  height: 25,
                ),
                CustomTextfield(
                  textFieldName: "(اختياري) العنوان",
                  hintText: 'العنوان',
                ),
                const SizedBox(
                  height: 50,
                ),
                CustomButton(
                  text: 'تأكيد',
                  onTap: () {
                    Get.to(HomeScreen());
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
