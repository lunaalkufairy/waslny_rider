import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:waslny_rider/components/custom_Button.dart';
import 'package:waslny_rider/components/custom_textField.dart';
import 'package:waslny_rider/components/page_top.dart';
import 'package:waslny_rider/constants.dart';
import 'package:waslny_rider/controllers/money_codes_controller.dart';

class MoneyCodesScreen extends StatelessWidget {
  const MoneyCodesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    MoneyCodesController controller = Get.put(MoneyCodesController());
    TextEditingController codeController = TextEditingController();

    return Scaffold(
      backgroundColor: black1,
      body: SingleChildScrollView(
        child: Column(
          children: [
            PageTop(pageName: "إضافة كود ", width: 35),
            SizedBox(
              height: 40,
            ),
            CustomTextfield(
              hintText: " الكود",
              textFieldName: ": يرجى إدخال الكود الخاص بك  ",
              controller: codeController,
            ),
            SizedBox(
              height: 540,
            ),
            CustomButton(
                onTap: () {
                  controller.code = codeController.text;
                  print(controller.code);
                  controller.checkCode();
                },
                text: 'إضافة')
          ],
        ),
      ),
    );
  }
}
