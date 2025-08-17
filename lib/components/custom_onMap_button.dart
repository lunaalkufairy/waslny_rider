import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';
import 'package:waslny_rider/screens/choose_location_on_map_screen.dart';

class CustomOnmapButton extends StatelessWidget {
  const CustomOnmapButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(ChooseLocationOnMapScreen());
      },
      borderRadius: BorderRadius.circular(10),
      child: Column(
        //mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset('assets/icons/Locations.svg'),
          const SizedBox(height: 6),
          Text(
            'تحديد على \nالخريطة',
            style: const TextStyle(
                color: Colors.white, fontSize: 10, fontFamily: 'cairo'),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
