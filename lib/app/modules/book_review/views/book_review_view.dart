import 'package:bookhub/app/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../core/custom_widgets/custom_button/custom_button.dart';
import '../controllers/book_review_controller.dart';

class BookReviewView extends GetView<BookReviewController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Book reviews"),
        actions: [
          IconButton(onPressed: (){
            Get.toNamed(Routes.ADD_BOOK_REVIEW);
          }, icon: Icon(Icons.add)),
        ],
      ),
      body: ListView.builder(
        padding: EdgeInsets.only(left: 20, right: 20, top: 15, bottom: 10),
        physics: BouncingScrollPhysics(),
        itemCount: 4,
        itemBuilder: ((context, index) => Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Container(
                height: 251,
                width: MediaQuery.of(context).size.width * 0.9,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 1,
                      blurRadius: 1,
                      offset: Offset(0.01, 0.01,), // changes position of shadow
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Container(
                          padding: EdgeInsets.only(
                              top: 7, bottom: 3, right: 3, left: 3),
                          height: 30,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                  width: 20,
                                  child: Icon(
                                    CupertinoIcons.person,
                                    size: 20,
                                  )),
                              SizedBox(),
                              Container(
                                  width: 187,
                                  child: Text(
                                    'Jushkinbek',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500),
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
                        Divider(),
                      ],
                    ),
                    Container(
                      height: 145,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                              padding: EdgeInsets.only(right: 10, left: 10),
                              height: 60,
                              child: Text(
                                '5 tips to create a modern App',
                                style: TextStyle(fontSize: 22),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              )),
                          Container(
                              padding: EdgeInsets.only(left: 10, right: 4),
                              child: Text(
                                'James Clear is a writer and speaker focused on habits, decision making, and continuous improvement. He is the author of the #1 New York Times bestseller, Atomic Habits. The b...'
                                'James Clear is a writer and speaker focused on habits, decision making, and continuous improvement. He is the author of the #1 New York Times bestseller, Atomic Habits. The b...',
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.w300),
                                maxLines: 4,
                                overflow: TextOverflow.ellipsis,
                              )),
                        ],
                      ),
                    ),
                    Center(
                      child: SizedBox(
                          height: 40,
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: CustomButton(onTap: () {
                            Get.toNamed('/book-review-details');
                          }, txt: 'read more')),
                    ),
                    SizedBox(
                      height: 10,
                    )
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
