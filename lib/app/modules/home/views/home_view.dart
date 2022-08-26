import 'package:bookhub/app/modules/book_details/views/book_details_view.dart';
import 'package:bookhub/app/routes/app_pages.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../core/theme/app_colors.dart';
import '../../add_book/controllers/add_book_controller.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
        appBar: AppBar(
          title: const SizedBox(
            height: 50,
            child: TextField(
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.zero,
                  prefixIcon: SizedBox(
                    width: 20,
                    height: 20,
                    child: Center(child: Icon(Icons.search)),
                  ),
                  filled: true,
                  fillColor: Color(0xffF9F9FD),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(12),
                    ),
                    gapPadding: 0,
                    borderSide: BorderSide.none,
                  ),
                  hintText: 'search'),
            ),
          ),
          leading: IconButton(
            onPressed: () {
              Get.toNamed("/profile");
            },
            icon: const Icon(
              CupertinoIcons.person_circle,
              size: 34,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                Get.toNamed('/add-book');
              },
              icon: const Icon(Icons.add),
              iconSize: 27,
            ),
          ],
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
              ...controller.bookSales.value.map((element) {
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => BookDetailsView(
                          title: element.title.toString(),
                          description: element.description.toString(),
                          postedTimestamp: getReadableTime(element.postedTimestamp),
                          ownerName: element.ownerName.toString(),
                          price: element.price.toString(),
                          phoneNumber: element.phoneNumber.toString(),
                          photoUrl: element.photoUrl.toString(),
                          category: element.category.toString(),
                          location: element.location.toString(),
                        ),
                      ),
                    );
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
                          // Container(
                          //   height: 120,
                          //   width: 85,
                          //   decoration: BoxDecoration(
                          //     image: DecorationImage(
                          //         image: NetworkImage(element.photoUrl ?? ""),
                          //         fit: BoxFit.fill),
                          //     color: AppColors.white,
                          //     borderRadius: BorderRadius.circular(10),
                          // boxShadow: [
                          //   BoxShadow(
                          //     color: Colors.grey.withOpacity(0.5),
                          //     spreadRadius: 1.2,
                          //     blurRadius: 1.2,
                          //     offset:
                          //         Offset(0, 3), // changes position of shadow
                          //   ),
                          // ],
                          //   ),
                          // ),
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
                                const SizedBox(
                                  height: 50,
                                ),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.location_on_outlined,
                                      size: 17,
                                    ),
                                    Text(
                                      element.location.toString(),
                                      style: TextStyle(fontSize: 13),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 0, bottom: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 30),
                                  child: IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        CupertinoIcons.bookmark,
                                        size: 23,
                                      )),
                                ),
                                Container(
                                  height: 15,
                                  //width: 60,
                                  padding: EdgeInsets.only(right: 10),
                                  child: Text(
                                    getReadableTime(element.postedTimestamp),
                                    style: TextStyle(fontSize: 10),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
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
