import 'package:flutter/material.dart';
import 'package:waslny_rider/components/page_top.dart';
import 'package:waslny_rider/constants.dart';

class AddingAddressScreen extends StatelessWidget {
  const AddingAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black1,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              PageTop(pageName: 'إضافة عنوان', width: 60),
              SizedBox(
                height: 40,
              ),
              Align(
                alignment: Alignment(0.88, 0),
                child: Text(
                  'العنوان',
                  style: TextStyle(
                    color: white,
                    fontSize: 18,
                    fontFamily: 'cairo',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
