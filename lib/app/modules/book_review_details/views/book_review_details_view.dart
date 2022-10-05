import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/theme/app_colors.dart';
import '../controllers/book_review_details_controller.dart';

class BookReviewDetailsView extends StatelessWidget {
  final String title;
  final String description;
  final String date;
  final String ownerName;
  final String likes;

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
        elevation: 0.4,
        shadowColor: AppColors.white,
        backgroundColor: AppColors.background,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
        child: ListView(
          children: [
            Container(
              height: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      Container(
                      width: 24,
                      child: Icon(
                        CupertinoIcons.person,
                        size: 22,
                      )),
                  SizedBox(width: 4,),
                  Container(
                      width: 187,
                      child: Text(
                        ownerName,
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w400),
                      )),

                    ],
                  ),
                  
                  Container(
                      //height: 30,
                      width: 49,
                      child: Text(
                        date,
                        style: TextStyle(
                          fontSize: 10,
                        ),
                        textAlign: TextAlign.start,
                      )),
                  Divider(),
                ],
              ),
            ),
            Text(
              title,
              style: GoogleFonts.ptSerif(
                  fontSize: 25, fontWeight: FontWeight.bold),
            ),
            Container(
              padding: EdgeInsets.only(top: 25),
              child: Text(description, style: GoogleFonts.ptSerif()),
            ),
            SizedBox(
              height: 20,
            ),
            
            Text(likes),
          ],
        ),
      ),
    );
  }
}
