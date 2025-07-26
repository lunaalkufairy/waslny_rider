import 'package:flutter/material.dart';
import 'package:waslny_rider/components/circle_Line.dart';
import 'package:waslny_rider/components/location_grey_center_circle.dart';
import 'package:waslny_rider/components/location_white_circle.dart';
import 'package:waslny_rider/components/location_grey_circle.dart';
import 'package:waslny_rider/constants.dart';

class MyOrdersTripInfo extends StatelessWidget {
  final List<dynamic> addresses;
  final String price;
  final String distance;
  const MyOrdersTripInfo(
      {super.key,
      required this.addresses,
      required this.price,
      required this.distance});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 350,
        height: 164,
        padding:
            const EdgeInsets.only(top: 16, bottom: 16, right: 16, left: 16),
        decoration: BoxDecoration(
            color: black,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: white)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Column(
              children: [
                Text(
                  'المبلغ',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontFamily: 'Cairo',
                  ),
                ),
                const SizedBox(height: 4),
                Container(
                  alignment: Alignment.center,
                  height: 30,
                  width: 70,
                  decoration: BoxDecoration(
                    color: white, // لون أخضر فاتح
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "\$ ",
                        style: const TextStyle(
                          color: green, // أخضر غامق
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'cairo',
                        ),
                      ),
                      Text(
                        price,
                        style: const TextStyle(
                          color: green, // أخضر غامق
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'cairo',
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 26),
                const Text(
                  'المسافة',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontFamily: 'Cairo',
                  ),
                ),
                Row(
                  children: [
                    Text(
                      distance,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontFamily: 'Cairo',
                      ),
                    ),
                    Text(
                      " KM",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontFamily: 'Cairo',
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Container(
              height: 170,
              width: 240,
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
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                index == 0
                                    ? 'مكان البدء'
                                    : index == addresses.length - 1
                                        ? 'الوجهة '
                                        : ' التوقف  $index',
                                style: TextStyle(
                                    color: white, fontFamily: 'cairo'),
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
                            width: 20,
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
                              height: 0,
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
              ),
            ),
          ],
        ));
  }
}
