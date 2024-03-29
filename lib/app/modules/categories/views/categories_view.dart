import 'dart:ui';

import 'package:bookhub/app/core/custom_widgets/custom_gridview_item/custom_gridview_item.dart';
import 'package:bookhub/app/core/theme/app_colors.dart';
import 'package:bookhub/app/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/categories_controller.dart';

class CategoriesView extends GetView<CategoriesController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Categories'.tr),
        centerTitle: true,
      ),
      body: GridView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.only(top: 10, right: 10, left: 10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 130 / 130,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10),
        children: [
          CustomGridViewItem(
              txt: 'Book reviews'.tr, icon: 'group', onpress: () {

                Get.toNamed(Routes.BOOK_REVIEW);
              }),
          CustomGridViewItem(
            icon: 'group',
            txt: 'txt',
            onpress: () {
              Get.toNamed(Routes.TODO);
            },
          ),
          
          // BackdropFilter(
          //   filter: new ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
          //   child: Container(
          //     height: 300,
          //   ),
          // ),
        ],
      ),
    );
  }
}
