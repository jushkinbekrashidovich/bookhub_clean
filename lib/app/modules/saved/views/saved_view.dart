import 'package:bookhub/app/modules/book_details/views/book_details_view.dart';
import 'package:bookhub/app/modules/saved/controllers/saved_controller.dart';
import 'package:bookhub/app/routes/app_pages.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../core/theme/app_colors.dart';
import '../../add_book/controllers/add_book_controller.dart';

class SavedView extends GetView<SavedController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
        appBar: AppBar(
          title: Text('New books'),
        ),
        body: ListView(
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.only(left: 10, right: 10, bottom: 10, top: 10),
            //primary: false,
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
                              children: const[
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
              ...controller.newBookSales.value.map((element) {
                return GestureDetector(
                  onTap: () {
                    // Navigator.of(context).push(
                    //   MaterialPageRoute(
                    //     builder: (context) => BookDetailsView(
                    //       title: element.title.toString(),
                    //       description: element.description.toString(),
                    //       postedTimestamp: getReadableTime(element.postedTimestamp),
                    //       ownerName: element.ownerName.toString(),
                    //       price: element.price.toString(),
                    //       phoneNumber: element.phoneNumber.toString(),
                    //       photoUrl: element.photoUrl.toString(),
                    //       category: element.category.toString(),
                    //     ),
                    //   ),
                    // );
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Container(
                      padding: EdgeInsets.only(
                        left: 6,
                      ),
                      height: 140,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CachedNetworkImage(
                            imageBuilder: (context, imageProvider) => Container(
                              width: 85.0,
                              height: 120.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 1.2,
                                    blurRadius: 1.2,
                                    offset: Offset(
                                        0, 3), // changes position of shadow
                                  ),
                                ],
                                image: DecorationImage(
                                    image: imageProvider, fit: BoxFit.cover),
                              ),
                            ),
                            imageUrl: element.photoUrl.toString(),
                            placeholder: (context, url) =>
                                CircularProgressIndicator(
                              strokeWidth: 2,
                            ),
                            errorWidget: (context, url, error) =>
                                Icon(Icons.error),
                          ),
                          Container(
                            padding: EdgeInsets.only(
                              left: 10,
                              top: 10,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              //mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  height: 20,
                                  width: 120,
                                  child: Text(
                                    element.title.toString(),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  padding: EdgeInsets.only(left: 4),
                                  height: 20,
                                  width: 120,
                                  child: Text(
                                    element.price.toString(),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        color: Colors.blue, fontSize: 15),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }),
            ])));
  }

 static String getReadableTime(int? timestamp) {
    if (timestamp == null) return "null";
    final normalTime = DateTime.fromMillisecondsSinceEpoch(timestamp);
    final today = DateTime.now();
    if (normalTime.day == today.day &&
        normalTime.month == today.month &&
        normalTime.year == today.year) {
      return getNormalDayOrMonth(normalTime.hour)+ ":"+getNormalDayOrMonth(normalTime.minute);
    }
    //print("datetime: " + today.compareTo(normalTime).toString());
    if ((normalTime.millisecondsSinceEpoch - today.millisecondsSinceEpoch)
            .abs() <=
        86400000) return 'Yesterday';
    return '${getNormalDayOrMonth(normalTime.day)}.${getNormalDayOrMonth(normalTime.month)}.${getNormalDayOrMonth(normalTime.year%100)}';
  }

  static String getNormalDayOrMonth(int dayOrMonth) {
    return dayOrMonth.toString().length == 1
        ? '0$dayOrMonth'
        : dayOrMonth.toString();
  }
}
