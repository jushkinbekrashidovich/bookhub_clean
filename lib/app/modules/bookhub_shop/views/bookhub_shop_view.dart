import 'package:bookhub/app/modules/book_details/views/book_details_view.dart';
import 'package:bookhub/app/modules/bookhub_shop/controllers/bookhub_shop_controller.dart';
import 'package:bookhub/app/modules/bookhub_shop_details/views/bookhub_shop_details_view.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../core/theme/app_colors.dart';
import '../../add_book/controllers/add_book_controller.dart';

class BookhubShopView extends GetView<BookhubShopController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 20,
              ),
              Text('Bookhub Shop'),
              SizedBox(
                width: 5,
              ),
              Container(
                decoration: BoxDecoration(
                    color: AppColors.red,
                    borderRadius: BorderRadius.circular(2)),
                height: 20,
                width: 40,
                child: Center(
                    child: Text(
                  'new',
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 14,
                  ),
                )),
              ),
            ],
          ),
        ),
        body: ListView(
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.only(left: 8, right: 8, bottom: 10, top: 10),
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
                              children: const [
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
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => BookhubShopDetailsView(
                          title: element.title.toString(),
                          description: element.description.toString(),
                          price: element.price.toString(),
                          phoneNumber: element.phoneNumber.toString(),
                          photoUrl: element.photoUrl.toString(),
                          authorName: element.authorName.toString(),
                          id: '',
                          type: element.type.toString(),
                          quality: element.quality.toString(),
                        ),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Container(
                      padding: EdgeInsets.only(
                        left: 10,
                      ),
                      height: 140,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: Colors.white,
                      ),
                      child: Row(
                        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CachedNetworkImage(
                            imageBuilder: (context, imageProvider) => Container(
                              width: 85.0,
                              height: 120.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(3),
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
                              left: 25,
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
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                SizedBox(
                                  child: Text(
                                    element.authorName.toString(),
                                    style: TextStyle(
                                        fontSize: 14,
                                        color:
                                            Color.fromARGB(255, 149, 148, 148)),
                                  ),
                                ),
                                SizedBox(height: 10,),

                                Container(
                                  padding: EdgeInsets.only(left: 3, right: 3),
                                  height: 20,
                                  decoration: BoxDecoration(
                                    color: element.quality.toString()=='new'?AppColors.red:AppColors.green,
                                    borderRadius: BorderRadius.circular(2)
                                  ),
                                  child: Text(
                                  element.quality.toString(),
                                  style: TextStyle(
                                     color: AppColors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500),
                                ),
                                ),
                                
                                const SizedBox(
                                  height: 15,
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
                                        color: Colors.blue, fontSize: 18),
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
      return getNormalDayOrMonth(normalTime.hour) +
          ":" +
          getNormalDayOrMonth(normalTime.minute);
    }
    //print("datetime: " + today.compareTo(normalTime).toString());
    if ((normalTime.millisecondsSinceEpoch - today.millisecondsSinceEpoch)
            .abs() <=
        86400000) return 'Yesterday';
    return '${getNormalDayOrMonth(normalTime.day)}.${getNormalDayOrMonth(normalTime.month)}.${getNormalDayOrMonth(normalTime.year % 100)}';
  }

  static String getNormalDayOrMonth(int dayOrMonth) {
    return dayOrMonth.toString().length == 1
        ? '0$dayOrMonth'
        : dayOrMonth.toString();
  }
}
