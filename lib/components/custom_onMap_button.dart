import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomOnmapButton extends StatelessWidget {
  const CustomOnmapButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
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
