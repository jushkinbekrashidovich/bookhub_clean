import 'package:bookhub/app/core/theme/app_colors.dart';
import 'package:bookhub/app/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../core/custom_widgets/custom_button/custom_button.dart';
import '../../book_review_details/views/book_review_details_view.dart';
import '../controllers/book_review_controller.dart';

class BookReviewView extends GetView<BookReviewController> {
  //BookReviewController bookReviewViewController = Get.put(BookReviewController());
  @override
  Widget build(BuildContext context) {
    return Obx(
      (() => Scaffold(
            appBar: AppBar(
              title: const Text("Book reviews"),
              actions: [
                IconButton(
                    onPressed: () {
                      Get.toNamed(Routes.ADD_BOOK_REVIEW);
                    },
                    icon: Icon(Icons.add)),
              ],
            ),
            body: ListView(
                padding:
                    EdgeInsets.only(left: 20, right: 20, top: 15, bottom: 10),
                physics: BouncingScrollPhysics(),
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12 * 1.0),
                    child: Visibility(
                        visible: controller.isLoading.value,
                        child: Container(
                          //padding: EdgeInsets.all(50),
                          //width: 85.w,
                          child: Container(
                              padding: EdgeInsets.all(15),
                              //width: double.infinity,
                              height: 200,
                              decoration: BoxDecoration(
                                color: AppColors.white,
                                borderRadius: BorderRadius.circular(12 * 1.0),
                              ),
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    CircularProgressIndicator(
                                      color: AppColors.mainColor,
                                    ),
                                    SizedBox(
                                      height: 25,
                                    ),
                                    Text(
                                      "Loading",
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              )),
                        )),
                  ),
                  ...controller.bookReviews.value.map(
                    (element) => Padding(
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
                              offset: Offset(
                                0.01,
                                0.01,
                              ), // changes position of shadow
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
                                      top: 7, right: 3, left: 3),
                                  height: 33,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
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
                                            element.ownerName.toString(),
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500),
                                          )),

                                      // SizedBox(
                                      //     height: 22,
                                      //     width: 50,
                                      //     child: Text(
                                      //       getReadableTime(
                                      //           element.postedTimestamp),
                                      //       style: TextStyle(fontSize: 10),
                                      //     )),
                                      Container(
                                        child: PopupMenuButton<int>(
                                          
                                          itemBuilder: (context) => [
                                            // popupmenu item 1
                                            PopupMenuItem(
                                              value: 1,
                                              child: Row(
                                                children: [
                                                  Icon(Icons.delete),
                                                  SizedBox(
                                                    // sized box with width 10
                                                    width: 10,
                                                  ),
                                                  Text("delete")
                                                ],
                                              ),
                                              onTap: ()async{
                                                await controller.deleteBookreview();
                                                

                                              },
                                            ),
                                            // popupmenu item 2
                                            PopupMenuItem(
                                              value: 2,
                                              // row has two child icon and text
                                              child: Row(
                                                children: [
                                                  Icon(
                                                      Icons.chrome_reader_mode),
                                                  SizedBox(
                                                    // sized box with width 10
                                                    width: 10,
                                                  ),
                                                  Text("About")
                                                ],
                                              ),
                                            ),
                                          ],
                                          offset: Offset(0, 50),
                                          color: Colors.white,
                                          elevation: 2,
                                        ),
                                      ),
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
                                      padding:
                                          EdgeInsets.only(right: 10, left: 10),
                                      height: 60,
                                      child: Text(
                                        element.title.toString(),
                                        style: TextStyle(fontSize: 22),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      )),
                                  Container(
                                      padding:
                                          EdgeInsets.only(left: 10, right: 4),
                                      child: Text(
                                        element.description.toString(),
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w300),
                                        maxLines: 4,
                                        overflow: TextOverflow.ellipsis,
                                      )),
                                ],
                              ),
                            ),
                            Center(
                              child: SizedBox(
                                  height: 40,
                                  width:
                                      MediaQuery.of(context).size.width * 0.8,
                                  child: CustomButton(
                                      onTap: () {
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                BookReviewDetailsView(
                                              title: element.title.toString(),
                                              description: element.description
                                                  .toString(),
                                              date: getReadableTime(
                                                  element.postedTimestamp),
                                              likes: element.likes ?? 0,
                                              ownerName:
                                                  element.ownerName.toString(),
                                            ),
                                          ),
                                        );
                                        // Get.toNamed('/book-review-details');
                                      },
                                      txt: 'read more')),
                            ),
                            SizedBox(
                              height: 10,
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ]),
          )),
    );
  }

  static String getReadableTime(int? timestamp) {
    if (timestamp == null) return "null";
    final normalTime = DateTime.fromMillisecondsSinceEpoch(timestamp);
    final today = DateTime.now();
    if (normalTime.day == today.day &&
        normalTime.month == today.month &&
        normalTime.year == today.year) {
      return "Today at ${getNormalDayOrMonth(normalTime.hour)}:${getNormalDayOrMonth(normalTime.minute)}";
    }
    //print("datetime: " + today.compareTo(normalTime).toString());
    if ((normalTime.millisecondsSinceEpoch - today.millisecondsSinceEpoch)
            .abs() <=
        86400000) return 'Yestarday';
    return '${getNormalDayOrMonth(normalTime.day)}.${getNormalDayOrMonth(normalTime.month)}.${getNormalDayOrMonth(normalTime.year % 100)}';
  }

  static String getNormalDayOrMonth(int dayOrMonth) {
    return dayOrMonth.toString().length == 1
        ? '0$dayOrMonth'
        : dayOrMonth.toString();
  }
}
