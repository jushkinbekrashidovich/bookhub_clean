import 'package:bookhub/app/modules/book_details/views/book_details_view.dart';
import 'package:bookhub/app/modules/bookhub_shop/controllers/bookhub_shop_controller.dart';
import 'package:bookhub/app/modules/bookhub_shop_details/views/bookhub_shop_details_view.dart';
import 'package:bookhub/app/routes/app_pages.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../core/theme/app_colors.dart';
import '../../add_book/controllers/add_book_controller.dart';

class BookhubShopView extends GetView<BookhubShopController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
        appBar: AppBar(
          title: Text('Bookshop'),
          actions: [
            IconButton(
              onPressed: () {
                Get.toNamed(Routes.ORDER_BOOKS);
              },
              icon: Icon(
                CupertinoIcons.shopping_cart,
                size: 24,
                color: AppColors.red,
              ),
            ),
            SizedBox(
              width: 10,
            )
          ],
        ),

        floatingActionButton: FloatingActionButton(
          backgroundColor: AppColors.mainColor,
          child: Icon(Icons.arrow_upward, color: AppColors.white,),
          onPressed: (){
          controller.scrollUp();
        }),
        body: ListView(
            controller: controller.scrollController,
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
                          photoUrl: element.photoUrl.toString(),
                          title: element.title.toString(),
                          price: element.price.toString(),
                          authorName: element.authorName.toString(),
                          quality: element.quality.toString(),
                          type: element.type.toString(),
                          description: element.description.toString(),
                          phoneNumber: element.phoneNumber.toString(),
                          pages: element.pages.toString(),
                          deliver: element.deliver.toString(),
                          id: '',
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
                          FancyShimmerImage(
                            width: 85.0,
                            height: 125.0,
                            errorWidget: Icon(
                              Icons.error,
                              color: Colors.red,
                              size: 28,
                            ),
                            imageUrl: element.photoUrl.toString(),
                            boxFit: BoxFit.fill,
                          ),
                          // CachedNetworkImage(
                          //   imageBuilder: (context, imageProvider) => Container(

                          //     decoration: BoxDecoration(
                          //       borderRadius: BorderRadius.circular(3),
                          //       boxShadow: [
                          //         BoxShadow(
                          //           color: Colors.grey.withOpacity(0.5),
                          //           spreadRadius: 1.2,
                          //           blurRadius: 1.2,
                          //           offset: Offset(
                          //               0, 3), // changes position of shadow
                          //         ),
                          //       ],
                          //       image: DecorationImage(
                          //           image: imageProvider, fit: BoxFit.cover),
                          //     ),
                          //   ),
                          //   imageUrl: element.photoUrl.toString(),
                          //   placeholder: (context, url) =>
                          //       CircularProgressIndicator(
                          //     strokeWidth: 2,
                          //   ),
                          //   errorWidget: (context, url, error) =>
                          //       Icon(Icons.error),
                          // ),
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
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  padding: EdgeInsets.only(left: 3, right: 3),
                                  height: 20,
                                  decoration: BoxDecoration(
                                      color: element.quality.toString() == 'new'
                                          ? AppColors.red
                                          : AppColors.green,
                                      borderRadius: BorderRadius.circular(4)),
                                  child: Center(
                                    child: Text(
                                      element.quality.toString(),
                                      style: TextStyle(
                                          color: AppColors.white,
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500),
                                    ),
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
                                        color: Colors.blue, fontSize: 16),
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
              
            ])
            )
            );

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
