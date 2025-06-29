import 'package:flutter/material.dart';
import 'package:waslny_rider/components/circle_Line.dart';
import 'package:waslny_rider/components/location_grey_center_circle.dart';
import 'package:waslny_rider/components/location_white_circle.dart';
import 'package:waslny_rider/components/location_grey_circle.dart';
import 'package:waslny_rider/constants.dart';

class MultieTripLocationCard extends StatelessWidget {
  final List<dynamic> addresses;
  const MultieTripLocationCard({super.key, required this.addresses});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 300,
        height: 160,
        padding:
            const EdgeInsets.only(top: 16, bottom: 16, right: 16, left: 16),
        decoration: BoxDecoration(
          color: black1,
          borderRadius: BorderRadius.circular(20),
        ),
        child: ListView.builder(
          padding: EdgeInsets.all(0),
          itemCount: addresses.length,
          itemBuilder: (context, index) {
            print(index);
            return Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Column(
                      children: [
                        Text(
                          index == 0
                              ? 'مكان البدء'
                              : index == addresses.length - 1
                                  ? 'الوجهة '
                                  : ' التوقف  $index',
                          style: TextStyle(color: white, fontFamily: 'cairo'),
                          textDirection: TextDirection.rtl,
                        ),
                        const SizedBox(height: 5),
                        Text(
                          addresses[index],
                          style: const TextStyle(
                              color: white, fontFamily: 'cairo'),
                          textDirection: TextDirection.rtl,
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 50,
                    ),
                    index == 0
                        ? LocationGreyCircle()
                        : index == addresses.length - 1
                            ? LocationWhiteCircle()
                            : LocationGreyCenterCircle(),
                  ],
                ),
                index == addresses.length - 1
                    ? SizedBox(
                        height: 10,
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          CircleLine(height: 40),
                          SizedBox(
                            width: 10,
                          )
                        ],
                      )
              ],
            );
          },
        ));
  }
}
