import 'package:bookhub/app/modules/book_details/views/book_details_view.dart';
import 'package:bookhub/app/routes/app_pages.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
          title: Text('Home'.tr),
          leading: IconButton(
            onPressed: () {
              Get.toNamed("/profile");
             // print(FirebaseAuth.instance.currentUser!.uid);
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
            IconButton(
                  onPressed: () {
                    showCupertinoDialog(
                        barrierDismissible: true,
                        context: context,
                        builder: (context) {
                          return CupertinoAlertDialog(
                            content: Text(
                              "Select language".tr,
                              style: TextStyle(fontSize: 20),
                            ),
                            actions: [
                              CupertinoDialogAction(
                                  child: Text("O'zbekcha"),
                                  onPressed: () {
                                    controller.changeLanguage('uz', 'UZ');
                                    Get.back();
                                  }),
                              CupertinoDialogAction(
                                  child: Text('English'),
                                  onPressed: () {
                                    controller.changeLanguage('en', 'EN');
                                    Get.back();
                                  }),
                              CupertinoDialogAction(
                                  child: Text('Русский'),
                                  onPressed: () {
                                    controller.changeLanguage('ru', 'RU');
                                    Get.back();
                                  }),
                            ],
                          );
                        });
                  },
                  icon: Icon(Icons.language)),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: AppColors.mainColor,
          child: Icon(Icons.arrow_upward, color: AppColors.white,),
          onPressed: (){
          controller.scrollUp();
        }),
        body: Column(
          children: [
            Expanded(
              child: ListView(
                controller: controller.scrollController,
                  padding:
                      EdgeInsets.only(left: 10, right: 10, bottom: 10, top: 10),
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
                                postedTimestamp:
                                    getReadableTime(element.postedTimestamp),
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
                                Row(
                                  children: [
                                    FancyShimmerImage(
                                  width: 90.0,
                                  height: 130.0,
                                  errorWidget: Icon(
                                    Icons.error,
                                    color: Colors.red,
                                    size: 28,
                                  ),
                                  imageUrl: element.photoUrl.toString(),
                                  boxFit: BoxFit.cover,
                                ),
                                SizedBox(width: 15,),
                                
                                Container(
                                  padding: EdgeInsets.only(
                                    left: 10,
                                    top: 10,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                      // IconButton(onPressed: (){
                                      //   controller.deleteReview(element);
                                      // }, icon: Icon(Icons.delete)),
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
                                          SizedBox(
                                            height: 19,
                                            width: 100,
                                            child: Text(
                                              element.location.toString(),
                                              style: TextStyle(fontSize: 13),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),

                                  ],
                                ),
                               
                               Container(
                                  padding: EdgeInsets.only(top: 0, bottom: 10),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                     controller.firebaseAuth.currentUser!=null?
                                     Column(
                                      children: [
                                        element.ownerName ==
                                              controller.firebaseAuth
                                                  .currentUser!.displayName
                                          ? IconButton(
                                            onPressed: () {
                                              showDialog(
                                                context: context,
                                                builder: (_) =>
                                                    CupertinoAlertDialog(
                                                  title: Text(
                                                    'Are you sure?'.tr,
                                                    style: TextStyle(
                                                        fontSize: 20),
                                                  ),
                                                  //content: Text('Iltimos mahsulotni tanlang'.tr, style: TextStyle(fontSize: 17),),
                                                  actions: [
                                                    CupertinoDialogAction(
                                                      isDefaultAction: true,
                                                      child: Text('Yes'.tr),
                                                      onPressed: () {
                                                        controller
                                                            .deletePost(
                                                                element);
                                                      },
                                                    ),
                                                    CupertinoDialogAction(
                                                      isDefaultAction: true,
                                                      child: Text('No'.tr),
                                                      onPressed: () {
                                                        Navigator.of(
                                                                context)
                                                            .pop();
                                                      },
                                                    ),
                                                  ],
                                                ),
                                              );
                                            },
                                            icon: Icon(CupertinoIcons
                                                .delete_solid),
                                          )
                                          : SizedBox(
                                              width: 30,
                                            ),

                                      ],
                                     ):SizedBox(),
                                      
                                      Container(
                                        height: 15,
                                        //width: 60,
                                        padding: EdgeInsets.only(right: 10),
                                        child: Text(
                                          getReadableTime(
                                              element.postedTimestamp),
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
                  ]),
            ),
          ],
        )));
  }

  static String getReadableTime(int? timestamp) {
    if (timestamp == null) return "null";
    final normalTime = DateTime.fromMillisecondsSinceEpoch(timestamp);
    final today = DateTime.now();
    // if (normalTime.day == today.day &&
    //     normalTime.month == today.month &&
    //     normalTime.year == today.year) {
    //   return getNormalDayOrMonth(normalTime.hour) +
    //       ":" +
    //       getNormalDayOrMonth(normalTime.minute);
    // }
    //print("datetime: " + today.compareTo(normalTime).toString());
    // if ((normalTime.millisecondsSinceEpoch - today.millisecondsSinceEpoch)
    //         .abs() <=
    //     86400000) return 'Yesterday';
    return '${getNormalDayOrMonth(normalTime.day)}.${getNormalDayOrMonth(normalTime.month)}.${getNormalDayOrMonth(normalTime.year % 100)}';
  }

  static String getNormalDayOrMonth(int dayOrMonth) {
    return dayOrMonth.toString().length == 1
        ? '0$dayOrMonth'
        : dayOrMonth.toString();
  }
}
