import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';

import '../../../core/theme/app_colors.dart';
import '../controllers/book_review_details_controller.dart';

class BookReviewDetailsView extends StatelessWidget {
  final String title;
  final String description;
  final String date;
  final String ownerName;
  final int likes;

  const BookReviewDetailsView({
    required this.title,
    required this.description,
    required this.date,
    required this.ownerName,
    required this.likes,
  }) : super();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.background,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: ListView(
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 25),
            ),
            Container(
              height: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                      width: 24,
                      child: Icon(
                        CupertinoIcons.person,
                        size: 22,
                      )),
                  SizedBox(),
                  Container(
                      width: 187,
                      child: Text(
                        ownerName,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      )),
                  Container(
                      //height: 30,
                      width: 49,
                      child: Text(
                        
                        date,
                        style: TextStyle(fontSize: 10, ),
                        textAlign: TextAlign.start,
                      )),
                  Divider(),
                ],
              ),
            ),
            Container(
              child: Text(
                description,
                style: TextStyle(
                    fontSize: 18,
                    letterSpacing: 1,
                    wordSpacing: 3,
                    fontWeight: FontWeight.w400),
              ),
            ),
            SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
