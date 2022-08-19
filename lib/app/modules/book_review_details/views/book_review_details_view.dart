import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';

import '../../../core/theme/app_colors.dart';
import '../controllers/book_review_details_controller.dart';

class BookReviewDetailsView extends GetView<BookReviewDetailsController> {
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
              '5 tips to create a modern app UI design',
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
                        'Jushkinbek',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      )),
                  Container(
                      //height: 30,
                      width: 49,
                      child: Text(
                        '22/12/22',
                        style: TextStyle(fontSize: 10),
                      )),
                  Divider(),
                ],
              ),
            ),
            Container(
              child: Text(
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the "
                "1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                style: TextStyle(
                    fontSize: 18,
                    letterSpacing: 1,
                    wordSpacing: 3,
                    fontWeight: FontWeight.w400),
              ),
            ),
           SizedBox(height: 20,),
           Padding(
             padding: const EdgeInsets.only(right: 40),
             child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                  IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset('assets/svg/clapping.svg'),
                ),
                Text('12,221', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),)
              ],
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
