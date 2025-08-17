import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:waslny_rider/components/rating_bar_component.dart';
import 'package:waslny_rider/components/select_person_options.dart';
import 'package:waslny_rider/constants.dart';

class TripOrderInformationButtomSheet extends StatelessWidget {
  const TripOrderInformationButtomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 452,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30))),
      child: Column(
        children: [
          SizedBox(
            height: 15,
          ),
          Container(
            decoration: BoxDecoration(
                color: white, borderRadius: BorderRadius.circular(20)),
            height: 5,
            width: 120,
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            width: 370,
            height: 70,
            decoration: BoxDecoration(
                color: lightBlack, borderRadius: BorderRadius.circular(20)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  width: 158,
                  height: 50,
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.circular(11),
                  ),
                  child: Row(
                    children: [
                      Text(
                        "الاثنين 7/10/2023",
                        style: TextStyle(
                            color: black,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'cairo'),
                      ),
                      SizedBox(width: 4),
                      Icon(Icons.calendar_today, size: 16, color: black),
                    ],
                  ),
                ),
                SizedBox(width: 25),
                Icon(Icons.star, color: Colors.yellow, size: 18),
                Text(
                  "5",
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'cairo'),
                ),
                SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "محمد نور",
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'cairo'),
                    ),
                    Text(
                      "السائق",
                      style: TextStyle(
                          fontSize: 12,
                          color: lightGrey,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'cairo'),
                    ),
                  ],
                ),
                SizedBox(width: 8),
                CircleAvatar(
                  radius: 22,
                ),
                SizedBox(width: 18),
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(
                ": معلومات الرحلة ",
                style: TextStyle(
                    fontSize: 18,
                    color: lightGrey,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'cairo'),
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "مدة الرحلة  *",
                      style: TextStyle(
                          fontSize: 15,
                          color: lightGrey,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'cairo'),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text(
                          "دقيقة",
                          style: TextStyle(
                              fontSize: 18,
                              color: lightGrey,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'cairo'),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "30  ",
                          style: TextStyle(
                              fontSize: 18,
                              color: lightGrey,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'cairo'),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "مسافة الرحلة  *",
                      style: TextStyle(
                          fontSize: 15,
                          color: lightGrey,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'cairo'),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text(
                          "كم",
                          style: TextStyle(
                              fontSize: 18,
                              color: lightGrey,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'cairo'),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "30  ",
                          style: TextStyle(
                              fontSize: 18,
                              color: lightGrey,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'cairo'),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "التقييم  *",
                      style: TextStyle(
                          fontSize: 15,
                          color: lightGrey,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'cairo'),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    RatingBar(
                      minRating: 1,
                      maxRating: 5,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemSize: 20,
                      itemPadding: EdgeInsetsGeometry.symmetric(horizontal: 0),
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
                      initialRating: 4,
                      onRatingUpdate: (double value) {},
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Align(
              alignment: Alignment.bottomRight,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "نوع الرحلة",
                    style: TextStyle(
                        fontSize: 18,
                        color: lightGrey,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'cairo'),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "فورية  * ",
                    style: TextStyle(
                        fontSize: 15,
                        color: lightGrey,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'cairo'),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(
                ": ملخص الدفع ",
                style: TextStyle(
                    fontSize: 18,
                    color: lightGrey,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'cairo'),
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "إجمالي المبلغ  *",
                      style: TextStyle(
                          fontSize: 15,
                          color: lightGrey,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'cairo'),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text(
                          "ل.س",
                          style: TextStyle(
                              fontSize: 18,
                              color: lightGrey,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'cairo'),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "3000  ",
                          style: TextStyle(
                              fontSize: 18,
                              color: lightGrey,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'cairo'),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "مبلغ الرحلة  *",
                      style: TextStyle(
                          fontSize: 15,
                          color: lightGrey,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'cairo'),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text(
                          "ل.س",
                          style: TextStyle(
                              fontSize: 18,
                              color: lightGrey,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'cairo'),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "3000  ",
                          style: TextStyle(
                              fontSize: 18,
                              color: lightGrey,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'cairo'),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
