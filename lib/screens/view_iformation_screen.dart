import 'package:flutter/material.dart';
import 'package:waslny_rider/components/custom_Button.dart';
import 'package:waslny_rider/components/custom_textField.dart';
import 'package:waslny_rider/components/page_top.dart';
import 'package:waslny_rider/constants.dart';

class ViewIformationScreen extends StatelessWidget {
  const ViewIformationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      body: SingleChildScrollView(
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
              text: 'حفظ',
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
