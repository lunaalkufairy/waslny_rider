import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/instance_manager.dart';
import 'package:waslny_rider/components/custom_Button.dart';
import 'package:waslny_rider/components/custom_textField.dart';
import 'package:waslny_rider/components/page_top.dart';
import 'package:waslny_rider/constants.dart';
import 'package:waslny_rider/controllers/get_user_information_screen_controller.dart';

class ViewIformationScreen extends StatelessWidget {
  const ViewIformationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    GetUserInfoScreenController controller = Get.find();
    TextEditingController firstNameController = TextEditingController();
    TextEditingController secondNameController = TextEditingController();

    return Scaffold(
        backgroundColor: black,
        body: GetBuilder<GetUserInfoScreenController>(
          builder: (controller) {
            controller.getUserInfo();
            return SingleChildScrollView(
              child: Column(
                children: [
                  PageTop(
                    pageName: "الملف الشخصي",
                    width: 35,
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  CustomTextfield(
                    textFieldName: "الاسم",
                    hintText: controller.firstName!,
                    controller: firstNameController,
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  CustomTextfield(
                    textFieldName: "الكنية",
                    hintText: controller.lasttName!,
                    controller: secondNameController,
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  CustomTextfield(
                    textFieldName: "الرقم",
                    hintText: " +${controller.number!}",
                    enabled: false,
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  CustomButton(
                    text: 'تعديل',
                    onTap: () {
                      controller.firstNameUpdate = firstNameController.text;
                      controller.lastNameUpdate = secondNameController.text;
                      print(controller.firstNameUpdate);
                      print(controller.lastNameUpdate);
                      controller.ubdateUserInfo();
                    },
                  ),
                ],
              ),
            );
          },
        ));
  }
}
