import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:waslny_rider/components/custom_Button.dart';
import 'package:waslny_rider/components/custom_textField.dart';
import 'package:waslny_rider/constants.dart';
import 'package:waslny_rider/controllers/add_information_Screen_controller.dart';
import 'package:waslny_rider/controllers/get_user_information_screen_controller.dart';
import 'package:waslny_rider/screens/home_screen.dart';

class AddInformationScreen extends StatelessWidget {
  const AddInformationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AddInformationScreenController controller =
        Get.put(AddInformationScreenController());
    GetUserInfoScreenController userInfoScreenController =
        Get.put(GetUserInfoScreenController());
    TextEditingController firstNameController = TextEditingController();
    TextEditingController secondNameController = TextEditingController();
    TextEditingController locationController = TextEditingController();

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
                  controller: firstNameController,
                ),
                SizedBox(
                  height: 25,
                ),
                CustomTextfield(
                  textFieldName: "الكنية",
                  hintText: 'الكنية',
                  controller: secondNameController,
                ),
                SizedBox(
                  height: 25,
                ),
                CustomTextfield(
                  textFieldName: "(اختياري) العنوان",
                  hintText: 'العنوان',
                  controller: locationController,
                ),
                const SizedBox(
                  height: 50,
                ),
                CustomButton(
                  text: 'تأكيد',
                  onTap: () {
                    controller.firstName = firstNameController.text;
                    controller.secondName = secondNameController.text;
                    controller.location = locationController.text;
                    print(controller.firstName);
                    print(controller.secondName);
                    print(controller.location);
                    controller.checkValues();
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
