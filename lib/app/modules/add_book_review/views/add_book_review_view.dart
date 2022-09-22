import 'package:bookhub/app/core/custom_widgets/loading_widgets/custom_circular_progress_indicator.dart';
import 'package:bookhub/app/modules/book_review/bindings/book_review_binding.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/custom_widgets/custom_button/custom_button.dart';
import '../../../core/theme/app_colors.dart';
import '../controllers/add_book_review_controller.dart';

class AddBookReviewView extends GetView<AddBookReviewController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddBookReviewController>(
      builder: (controller) => Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: Icon(
                    CupertinoIcons.xmark,
                    size: 22,
                  )),
              TextButton(
                  onPressed: () async {
                    showDialog(
                        context: context,
                        barrierDismissible: true,
                        builder: (BuildContext context) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        });
                    controller.validation();
                  },
                  child: Text(
                    'Publish',
                    style:
                        TextStyle(fontSize: 19, fontWeight: FontWeight.w400),
                  ))
            ],
          ),
          automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColor: AppColors.background,
          
        ),
        
        body: ListView(
          children: [
            TextFormField(
              textInputAction: TextInputAction.next,
              style: GoogleFonts.ptSerif(
                  fontSize: 20, fontWeight: FontWeight.bold),
              keyboardType: TextInputType.text,
              controller: controller.titleController,
              decoration: const InputDecoration(
                  contentPadding: EdgeInsets.all(12),
                  // suffixIcon: Icon(Icons.clear_rounded),
                  filled: true,
                  fillColor: AppColors.background,
                  hintText: 'title'),
            ),
            TextFormField(
              textInputAction: TextInputAction.newline,
              style: GoogleFonts.ptSerif(
                  fontSize: 18, fontWeight: FontWeight.w400),
              controller: controller.descriptionController,
              maxLines:10000,
              decoration: const InputDecoration(
                  contentPadding: EdgeInsets.only(
                    left: 10,
                    top: 10,
                  ),
                  fillColor: AppColors.background,
                  hintText: 'about'),
            ),
          ],
        ),
      ),
    );
  }
}
