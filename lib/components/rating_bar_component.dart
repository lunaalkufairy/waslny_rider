import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:waslny_rider/constants.dart';
import 'package:waslny_rider/controllers/rating_controller.dart';

class RatingBarComponent extends StatelessWidget {
  RatingBarComponent({super.key});
  final RatingController ratingController = Get.put(RatingController());
  //double _currentRating = 3.0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'تقييم الرحلة',
          style: TextStyle(fontFamily: 'Cairo', fontSize: 20, color: white),
        ),
        SizedBox(
          height: 10,
        ),
        RatingBar(
          minRating: 1,
          maxRating: 5,
          initialRating: ratingController.rating.value,
          allowHalfRating: true,
          itemCount: 5,
          itemSize: 40,
          itemPadding: EdgeInsetsGeometry.symmetric(horizontal: 4),
          ratingWidget: RatingWidget(
              full: Icon(
                Icons.star,
                color: yellow,
              ),
              half: Icon(
                Icons.star_half,
                color: yellow,
              ),
              empty: Icon(
                Icons.star,
                color: grey3,
              )),
          onRatingUpdate: (rating) {
            ratingController.updateRating(rating);
            print(ratingController.rating.value);
          },
        ),
      ],
    );
  }
}
