import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:waslny_rider/constants.dart';

final defaultPinTheme = PinTheme(
  width: 52,
  height: 52,
  decoration: BoxDecoration(
    color: black,
    border: Border.all(width: 1, color: grey),
    borderRadius: BorderRadius.circular(16),
  ),
  textStyle: TextStyle(
      color: lightWhite1,
      fontFamily: 'assets/fonts/Cairo-Bold.ttf',
      fontSize: 20),
);
final focusedPinTheme = PinTheme(
  width: 52,
  height: 52,
  decoration: BoxDecoration(
    color: blue,
    border: Border.all(width: 1, color: blue),
    borderRadius: BorderRadius.circular(16),
  ),
  textStyle: TextStyle(
    color: white1,
    fontFamily: 'assets/fonts/Cairo-Bold.ttf',
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
  textStyle: TextStyle(
    color: white,
    fontFamily: 'assets/fonts/Cairo-Bold.ttf',
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
  textStyle: TextStyle(
    color: red,
    fontFamily: 'assets/fonts/Cairo-Bold.ttf',
    fontSize: 20,
  ),
);

class OtpTextfield extends StatelessWidget {
  const OtpTextfield({super.key});

  @override
  Widget build(BuildContext context) {
    return Pinput(
      length: 6,
      defaultPinTheme: defaultPinTheme,
      focusedPinTheme: focusedPinTheme,
      submittedPinTheme: submittedPinTheme,
      errorPinTheme: errorPinTheme,
      validator: (pin) {
        return pin == '222222' ? null : 'Pin is incorrect';
      },
      pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
      showCursor: true,
      onCompleted: (pin) => print(pin),
    );
  }
}
