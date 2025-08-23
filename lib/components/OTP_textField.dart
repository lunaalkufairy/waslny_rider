import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:waslny_rider/constants.dart';
import 'package:waslny_rider/controllers/otp_page_controller.dart';

final defaultPinTheme = PinTheme(
  width: 52,
  height: 52,
  decoration: BoxDecoration(
    color: black,
    border: Border.all(width: 1, color: grey),
    borderRadius: BorderRadius.circular(16),
  ),
  textStyle: const TextStyle(
    color: lightWhite1,
    fontFamily: 'cairo',
    fontSize: 20,
  ),
);

final focusedPinTheme = PinTheme(
  width: 52,
  height: 52,
  decoration: BoxDecoration(
    color: blue,
    border: Border.all(width: 1, color: blue),
    borderRadius: BorderRadius.circular(16),
  ),
  textStyle: const TextStyle(
    color: white1,
    fontFamily: 'cairo',
    fontSize: 20,
  ),
);

final submittedPinTheme = PinTheme(
  width: 52,
  height: 52,
  decoration: BoxDecoration(
    color: blue,
    border: Border.all(width: 1, color: blue),
    borderRadius: BorderRadius.circular(16),
  ),
  textStyle: const TextStyle(
    color: white,
    fontFamily: 'cairo',
    fontSize: 20,
  ),
);

final errorPinTheme = PinTheme(
  width: 52,
  height: 52,
  decoration: BoxDecoration(
    color: black,
    border: Border.all(width: 1, color: red),
    borderRadius: BorderRadius.circular(16),
  ),
  textStyle: const TextStyle(
    color: red,
    fontFamily: 'cairo',
    fontSize: 20,
  ),
);

class OtpTextfield extends StatelessWidget {
  OtpTextfield({super.key});

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<OtpPageController>();

    return GetBuilder<OtpPageController>(
      builder: (contoller) {
        return Form(
          key: formKey,
          child: Pinput(
            length: 6,
            defaultPinTheme: defaultPinTheme,
            focusedPinTheme: focusedPinTheme,
            submittedPinTheme: submittedPinTheme,
            errorPinTheme: errorPinTheme,
            validator: (pin) {
              return controller.validator;
            },
            pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
            showCursor: true,
            onCompleted: (pin) async {
              await controller.otpCheck(pin);

              formKey.currentState?.validate();
            },
            onChanged: (val) {
              controller.resetValidator();
            },
          ),
        );
      },
    );
  }
}
