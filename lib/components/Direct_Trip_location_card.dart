import 'package:flutter/material.dart';
import 'package:waslny_rider/components/circle_Line.dart';
import 'package:waslny_rider/components/location_white_circle.dart';
import 'package:waslny_rider/components/location_grey_circle.dart';
import 'package:waslny_rider/constants.dart';

class DirectTripLocationCard extends StatelessWidget {
  final String startAddress;
  final String destinationAddress;

  const DirectTripLocationCard({
    super.key,
    required this.startAddress,
    required this.destinationAddress,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: black1,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'مكان البدء',
                style: TextStyle(color: white, fontFamily: 'cairo'),
                textDirection: TextDirection.rtl,
              ),
              const SizedBox(height: 5),
              Text(
                startAddress,
                style: const TextStyle(color: white, fontFamily: 'cairo'),
                textDirection: TextDirection.rtl,
              ),
              const SizedBox(height: 25),
              const Text(
                'الوجهة',
                style: TextStyle(color: white, fontFamily: 'cairo'),
                textDirection: TextDirection.rtl,
              ),
              const SizedBox(height: 5),
              Text(
                destinationAddress,
                style: const TextStyle(color: white, fontFamily: 'cairo'),
                textDirection: TextDirection.rtl,
              ),
            ],
          ),
          Column(
            children: [
              LocationGreyCircle(),
              CircleLine(
                height: 40,
              ),
              LocationWhiteCircle()
            ],
          ),
        ],
      ),
    );
  }
}
