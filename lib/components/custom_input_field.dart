import 'package:flutter/material.dart';
import 'package:waslny_rider/constants.dart';

class CustomInputField extends StatelessWidget {
  final String hintText;
  const CustomInputField({super.key, required this.hintText});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value) {},
      cursorColor: white,
      keyboardType: TextInputType.streetAddress,
      style: TextStyle(
        color: white,
        fontFamily: 'cairo',
        fontSize: 18,
      ),
      textDirection: TextDirection.rtl,
      textAlign: TextAlign.right,
      decoration: InputDecoration(
          filled: true,
          fillColor: grey1,
          hintText: hintText,
          hintStyle: TextStyle(
            color: white.withOpacity(0.5),
            fontFamily: 'cairo',
            fontSize: 14,
          ),
          contentPadding: EdgeInsets.all(15),
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
          suffixIcon:
              // SvgPicture.asset(
              //   'assets/icons/location.svg',
              //   color: blue,
              // ),
              Icon(
            Icons.location_on_rounded,
            color: blue,
            size: 30,
          )),
    );
  }
}
