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
        title: Text('CategoriesView'),
        centerTitle: true,
      ),
      body: GridView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.only(top: 10, right: 10, left: 10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 130 / 150,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10),
        children: [
          CustomGridViewItem(
            icon: CupertinoIcons.square_list,
            txt: 'Progress',
            onpress: () {
              Get.toNamed(Routes.TODO);
            },
          ),
          CustomGridViewItem(
              txt: 'txt', icon: CupertinoIcons.book, onpress: () {})
        ],
      ),
      
    );
  }
}
