import 'package:flutter/material.dart';
import 'package:waslny_rider/components/custom_Button.dart';
import 'package:waslny_rider/components/custom_textField.dart';
import 'package:waslny_rider/components/page_top.dart';
import 'package:waslny_rider/constants.dart';

class AddADiscountCardScreen extends StatelessWidget {
  const AddADiscountCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black1,
      body: SingleChildScrollView(
        child: Column(
          children: [
            PageTop(pageName: "إضافة رمز خصم", width: 35),
            SizedBox(
              height: 40,
            ),
            CustomTextfield(
                hintText: "رمز الخصم",
                textFieldName: ": يرجى إدخال رمز الخصم الخاص بك  "),
            SizedBox(
              height: 540,
            ),
            CustomButton(onTap: () {}, text: 'إضافة')
          ],
        ),
      ),
    );
  }
}
