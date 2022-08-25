import 'package:bookhub/app/modules/main/bindings/main_binding.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/custom_widgets/custom_snackbar.dart';
import '../../../data/models/book_review_model.dart';
import '../../../routes/app_pages.dart';
import '../../main/controllers/main_controller.dart';

class AddBookReviewController extends GetxController {
  RxBool isActive = false.obs;
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  Future<void> upload() async {
    BookReview bookReview = BookReview();

    final currUser = FirebaseAuth.instance.currentUser!;
    bookReview.title = titleController.text;
    bookReview.description = descriptionController.text;
    bookReview.ownerName = currUser.displayName;
    bookReview.postedTimestamp = DateTime.now().millisecondsSinceEpoch;
    bookReview.userId = currUser.uid;
    await FirebaseFirestore.instance
        .collection("bookReviews")
        .add(bookReview.toJson())
        .then((value) {
      //Get.find<MainController>().setMenu(BottomMenu.reviews);
      Get.back();
      //Get.offAllNamed(Routes.BOOK_REVIEW,);
    }).catchError((err) {
      // Get.back();
      showErrorSnackbar(err.toString());
    });
  }


  validation() async{
     if ( titleController.text.isEmpty) {
       Get.snackbar("Error", "Please enter tittle", );
       return false;
     }
     if ( descriptionController.text.isEmpty) {
       Get.snackbar("Error", "Please enter description", );
       return false;
     }
    upload();
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
