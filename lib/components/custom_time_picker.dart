import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:waslny_rider/constants.dart';

class CustomTimePicker extends StatefulWidget {
  const CustomTimePicker({super.key});

  @override
  State<CustomTimePicker> createState() => _CustomTimePickerState();
}

class _CustomTimePickerState extends State<CustomTimePicker> {
  TimeOfDay timeOfDay = TimeOfDay(hour: 11, minute: 28);
  void _showTimePicker() {
    showTimePicker(
      context: context,
      cancelText: 'إلغاء',
      confirmText: 'متابعة',
      helpText: 'تحديد الوقت',
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: Theme.of(context).copyWith(
            timePickerTheme: TimePickerThemeData(
              backgroundColor: black1,
              cancelButtonStyle: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 30),
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: lightWhite1),
                  borderRadius: BorderRadiusGeometry.circular(20),
                ),
                backgroundColor: white,
                textStyle: TextStyle(
                  fontFamily: 'assets/fonts/Cairo-Bold.ttf',
                  fontSize: 20,
                  color: grey1,
                ),
              ),
              confirmButtonStyle: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 30),
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: blue),
                  borderRadius: BorderRadiusGeometry.circular(20),
                ),
                backgroundColor: blue,
                textStyle: TextStyle(
                  fontFamily: 'assets/fonts/Cairo-Bold.ttf',
                  fontSize: 20,
                  color: grey1,
                ),
              ),
            ),
          ),
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: child!,
          ),
        );
      },
      initialEntryMode: TimePickerEntryMode.dialOnly,
      initialTime: TimeOfDay.now(),
    ).then(
      (value) {
        setState(
          () {
            timeOfDay = value!;
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: _showTimePicker,
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
