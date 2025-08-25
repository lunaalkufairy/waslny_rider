import 'package:flutter/material.dart';
import 'package:waslny_rider/constants.dart';

class DiscountCard extends StatelessWidget {
  final String discountValue;
  final String validUntil;

  const DiscountCard({
    super.key,
    required this.discountValue,
    required this.validUntil,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
          color: black, // لون خلفية داكن
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: white)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                '- $discountValue%',
                style: const TextStyle(
                    color: white, fontSize: 30, fontFamily: 'cairo'),
              ),
            ],
          ),
          const SizedBox(height: 12),
          LayoutBuilder(
            builder: (context, constraints) {
              final boxWidth = constraints.constrainWidth();
              const dashWidth = 11.0;
              const dashSpace = 9.0;
              final dashCount = (boxWidth / (dashWidth + dashSpace)).floor();

              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(dashCount, (_) {
                  return SizedBox(
                    width: dashWidth,
                    height: 2,
                    child: DecoratedBox(
                      decoration: BoxDecoration(color: Colors.white),
                    ),
                  );
                }),
              );
            },
          ),
          const SizedBox(height: 12),
          const Text(
            'Applies to First Purchase',
            style: TextStyle(color: white, fontSize: 16, fontFamily: 'cairo'),
            textAlign: TextAlign.right,
          ),
          const SizedBox(height: 4),
          Text(
            'Valid until $validUntil',
            style: TextStyle(
                color: white.withOpacity(0.7),
                fontSize: 14,
                fontFamily: 'cairo'),
            textAlign: TextAlign.right,
          ),
        ],
      ),
    );
  }
}
