import 'dart:convert';

import 'package:bookhub/app/core/custom_widgets/custom_button/custom_button.dart';
import 'package:bookhub/app/core/custom_widgets/text_fields/custom_text_field.dart';
import 'package:bookhub/app/core/theme/app_colors.dart';
import 'package:bookhub/app/data/models/todo.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/todo_controller.dart';

class TodoView extends GetView<TodoController> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
          appBar: AppBar(
            backgroundColor: Color.fromARGB(255, 148, 193, 242),
            elevation: 0,
          ),
          // bottomNavigationBar: BottomAppBar(
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children: [
          //       IconButton(onPressed: () {}, icon: Icon(Icons.all_inbox))
          //     ],
          //   ),
          // ),
          body: Obx(() => Column(
                  children: [
                    Container(
                      height: 200,
                      padding: EdgeInsets.only(top: 2, right: 13, left: 13),
                      color: Color.fromARGB(255, 148, 193, 242),
                      width: double.infinity,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                //color: Colors.blue,
                                height: 60,
                                width: 150,
                                child: Center(
                                  child: Text(
                                    controller.firebaseAuth.currentUser!
                                        .displayName!
                                        .split(' ')[0]
                                        .toString(),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: AppColors.white),
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(top: 0, right: 15),
                                child: CachedNetworkImage(
                                  imageBuilder: (context, imageProvider) =>
                                      Container(
                                    width: 54.0,
                                    height: 54.0,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                          image: imageProvider,
                                          fit: BoxFit.cover),
                                    ),
                                  ),
                                  imageUrl: controller
                                      .firebaseAuth.currentUser!.photoURL
                                      .toString(),
                                  placeholder: (context, url) =>
                                      CircularProgressIndicator(
                                    strokeWidth: 2,
                                  ),
                                  errorWidget: (context, url, error) =>
                                      Icon(Icons.error),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                            height: 86,
                            width: Get.size.width * 0.9,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: AppColors.white),
                            child: Row(
                              //mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Column(
                                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Text(
                                      'Avg.mon',
                                      style: TextStyle(
                                          fontSize: 13,
                                          color: AppColors.grey,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    SizedBox(
                                      width: 85,
                                      child: Text(
                                          (controller.todos.length / 30)
                                              .toInt()
                                              .toString(),
                                          style: TextStyle(
                                            fontSize: 19,
                                          ),
                                          textAlign: TextAlign.center),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                    height: 70,
                                    child: VerticalDivider(
                                      thickness: 2,
                                    )),
                                Column(
                                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,

                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Text(
                                      'Avg.year',
                                      style: TextStyle(
                                          fontSize: 13,
                                          color: AppColors.grey,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    SizedBox(
                                      width: 70,
                                      child: Text(
                                          (controller.todos.length / 30)
                                              .toInt()
                                              .toString(),
                                          style: TextStyle(
                                            fontSize: 19,
                                          ),
                                          textAlign: TextAlign.center),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                    height: 70,
                                    child: VerticalDivider(
                                      thickness: 2,
                                    )),
                                Column(
                                  //mainAxisAlignment: MainAxisAlignment.spaceAround,

                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Text(
                                      'All',
                                      style: TextStyle(
                                          fontSize: 13,
                                          color: AppColors.grey,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    SizedBox(
                                      width: 90,
                                      child: Text(
                                        controller.todos.length.toString(),
                                        style: TextStyle(
                                          fontSize: 19,
                                        ),
                                        textAlign: TextAlign.center,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 15, top: 15),
                      child: Row(
                        children: [
                          Text(
                            'My Bookshelf',
                            style: TextStyle(fontSize: 23),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: controller.todos().length,
                        itemBuilder: (context, index) {
                          // index = index+1;
                          int order = index + 1;

                          return ListTile(
                              leading: Container(
                                decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 189, 186, 191),
                                    borderRadius: BorderRadius.circular(5)),
                                height: 35,
                                width: 35,
                                child: IconButton(
                                    onPressed: () {
                                      showDialog(
                                        context: context,
                                        builder: (_) => CupertinoAlertDialog(
                                          title: Text(
                                            'Are you sure'.tr,
                                            style: TextStyle(fontSize: 20),
                                          ),
                                          //content: Text('Iltimos mahsulotni tanlang'.tr, style: TextStyle(fontSize: 17),),
                                          actions: [
                                            CupertinoDialogAction(
                                              isDefaultAction: true,
                                              child: Text('Yes'),
                                              onPressed: () {
                                                controller.todos
                                                    .removeAt(index);
                                                    Get.back();
                                              },
                                            ),
                                            CupertinoDialogAction(
                                              isDefaultAction: true,
                                              child: Text('No'),
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                    icon: Icon(
                                      Icons.delete,
                                      color: AppColors.red,
                                      size: 19,
                                    )),
                              ),
                              title: Text(
                                controller.todos[index].text.toString(),
                                style: GoogleFonts.ptSerif(
                                    fontSize: 16, fontWeight: FontWeight.w400),
                              ),
                              trailing: Text(
                                getReadableTime(
                                  controller.todos[index].postedTimestamp,
                                ),
                                style: TextStyle(
                                    fontSize: 13, color: Colors.black54),
                              ),);
                        },
                      ),
                    ),
                  ],
                ),),
          floatingActionButton: FloatingActionButton(
            backgroundColor: AppColors.mainColor,
            onPressed: () {
              Get.bottomSheet(
                Builder(builder: (context) {
                  return Container(
                      height: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20)),
                        color: AppColors.white,
                      ),
                      child: Padding(
                        padding:
                            const EdgeInsets.only(top: 30, left: 10, right: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: Text('Title of the book'),
                            ),
                            Center(
                              child: SizedBox(
                                width: Get.size.width * 0.9,
                                child: TextField(
                                  controller: controller.titleOfBookcontroller,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            CustomButton(
                                onTap: () {
                                  controller.todos.add(Todo(
                                    text: controller.titleOfBookcontroller.text,
                                    postedTimestamp:
                                        DateTime.now().millisecondsSinceEpoch,
                                  ));
                                  Get.back();
                                  controller.titleOfBookcontroller.clear();
                                  //print(jsonEncode(controller.todos) );
                                },
                                txt: 'save'),
                          ],
                        ),
                      ));
                }),
                //isScrollControlled: true,
              );
            },
            child: Icon(
              Icons.add,
              color: AppColors.white,
              size: 40,
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
        );
  }

  static String getReadableTime(int? timestamp) {
    if (timestamp == null) return "null";
    final normalTime = DateTime.fromMillisecondsSinceEpoch(timestamp);
    final today = DateTime.now();
    // if (normalTime.day == today.day &&
    //     normalTime.month == today.month &&
    //     normalTime.year == today.year) {
    //   return "today at ${getNormalDayOrMonth(normalTime.hour)}:${getNormalDayOrMonth(normalTime.minute)}";
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
