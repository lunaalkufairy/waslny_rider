import 'package:flutter/material.dart';
import 'package:waslny_rider/constants.dart';

class CustomTextfield extends StatelessWidget {
  final String? hintText;
  final String? errorText;
  final String? textFieldName;
  const CustomTextfield(
      {super.key,
      required this.hintText,
      this.errorText,
      required this.textFieldName});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        if (textFieldName != null)
          Text(
            textFieldName!,
            style: TextStyle(
              color: white,
              fontFamily: 'cairo',
              fontSize: 16,
            ),
          ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          width: 345,
          child: TextField(
            onChanged: (value) {},
            cursorColor: white,
            keyboardType: TextInputType.name,
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
                fontSize: 18,
              ),
              errorText: errorText,
              errorStyle: TextStyle(
                color: red,
                fontFamily: 'cairo',
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
          ),
        ),
      ],
    );
  }
}
