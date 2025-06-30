import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:waslny_rider/constants.dart';
import 'package:waslny_rider/tools/clock_view.dart';

class CustomTimePicker extends StatefulWidget {
  const CustomTimePicker({super.key});

  @override
  State<CustomTimePicker> createState() => _CustomTimePickerState();
}

class _CustomTimePickerState extends State<CustomTimePicker> {
  TimeOfDay timeOfDay = TimeOfDay.now();
  void _customShowTimePicker() {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: black1,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: SizedBox(
              width: double.maxFinite,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'تحديد الوقت',
                    style: TextStyle(
                      color: white,
                      fontSize: 18,
                      fontFamily: 'Cairo',
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    timeOfDay.format(context).toString(),
                    style: TextStyle(
                      fontFamily: 'Cairo',
                      fontSize: 20,
                      color: grey2,
                    ),
                  ),
                  //--------- Custom Clock ----------
                  ClockView(),
                  const SizedBox(height: 20),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(horizontal: 50),
                            backgroundColor: white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadiusGeometry.circular(15),
                            ),
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            'إلغاء',
                            style: TextStyle(
                              fontFamily: 'Cairo',
                              fontSize: 15,
                              color: black1,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(horizontal: 50),
                            backgroundColor: blue,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadiusGeometry.circular(15),
                            ),
                          ),
                          onPressed: () {
                            setState(() {
                              timeOfDay = TimeOfDay
                                  .now(); // أو القيمة اللي بتختاريها من التصميم لاحقًا
                            });
                            Navigator.pop(context);
                          },
                          child: Text(
                            'متابعة',
                            style: TextStyle(
                              fontFamily: 'Cairo',
                              fontSize: 15,
                              color: white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: _customShowTimePicker,
      style: TextButton.styleFrom(
        backgroundColor: black1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(15),
          side: BorderSide(
            color: lightWhite,
          ),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            textAlign: TextAlign.right,
            textDirection: TextDirection.rtl,
            timeOfDay.format(context).toString(),
            style: TextStyle(
              fontFamily: 'assets/fonts/Cairo-Bold.ttf',
              color: white,
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Container(
              height: 32,
              width: 32,
              padding: EdgeInsets.all(2),
              decoration: BoxDecoration(
                  color: blue, borderRadius: BorderRadius.circular(10)),
              child: SvgPicture.asset('assets/icons/Clock Circle.svg')),
        ],
      ),
    );
  }
}
