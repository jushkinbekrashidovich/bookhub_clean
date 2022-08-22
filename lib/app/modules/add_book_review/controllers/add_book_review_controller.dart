import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddBookReviewController extends GetxController {
  //TODO: Implement AddBookReviewController
  TextEditingController title = TextEditingController();
  TextEditingController description = TextEditingController();

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

  // Future<void> upload() async {
  //   BookReview bookReview = BookReview();

  //   final currUser = FirebaseAuth.instance.currentUser!;

  //   bookReview.title = title.text;
  //   bookReview.description = description.text;
  //   bookReview.ownerName = currUser.displayName;
  //   bookReview.postedTimestamp = DateTime.now().millisecondsSinceEpoch;
  //   bookReview.userId = currUser.uid;

  //   FirebaseFirestore.instance
  //       .collection("bookReviews")
  //       .add(bookReview.toJson())
  //       .then((value) {
  //     Get.back();
  //     // showSuccessSnackbar("Book added");
  //   }).catchError((err) {
  //     // Get.back();
  //     showErrorSnackbar(err.toString());
  //   });
 // }
}
