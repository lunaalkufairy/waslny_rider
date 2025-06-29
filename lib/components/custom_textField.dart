import 'package:flutter/material.dart';
import 'package:waslny_rider/constants.dart';

class CustomTextfield extends StatelessWidget {
  final String? hintText;
  final String? errorText;
  const CustomTextfield({super.key, required this.hintText, this.errorText});
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value) {},
      cursorColor: white,
      keyboardType: TextInputType.name,
      style: TextStyle(
        color: white,
        fontFamily: 'assets/fonts/Cairo-Bold.ttf',
        fontSize: 18,
      ),
      textDirection: TextDirection.rtl,
      textAlign: TextAlign.right,
      decoration: InputDecoration(
        filled: true,
        fillColor: grey1,
        hintText: hintText,
        hintStyle: TextStyle(
          color: white,
          fontFamily: 'assets/fonts/Cairo-Bold.ttf',
          fontSize: 18,
        ),
        errorText: errorText,
        errorStyle: TextStyle(
          color: red,
          fontFamily: 'assets/fonts/Cairo-Bold.ttf',
          fontSize: 18,
        ),
        contentPadding: EdgeInsets.only(right: 18),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: lightWhite),
          borderRadius: BorderRadius.circular(20),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: lightWhite),
          borderRadius: BorderRadius.circular(20),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: lightWhite),
          borderRadius: BorderRadius.circular(20),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: red),
          borderRadius: BorderRadius.circular(20),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: red),
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}
