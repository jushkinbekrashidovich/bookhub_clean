
import 'package:bookhub/app/routes/app_pages.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../../../core/custom_widgets/custom_snackbar/custom_snackbar.dart';
import '../../../data/models/book_review_model.dart';

class BookReviewController extends GetxController {
  late final FirebaseFirestore firestore;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final bookReviews = <BookReview>[].obs;
  final isLoading = true.obs;

  @override
  void onInit() {
    firestore = FirebaseFirestore.instance;
    print("here we go again in book reveiews");
    update();
    super.onInit();
  }

  @override
  void onReady() async {
    isLoading.value = true;
    try {
      bookReviews.value = await fetchBookReviews();
    } catch (err) {
      showErrorSnackbar(
          "Error while fetching foods from server: " + err.toString());
      throw err;
    }
    isLoading.value = false;
    update();

    super.onReady();
  }

  Future<List<BookReview>> fetchBookReviews() async {
    final List<BookReview> books = [];
    await firestore
        .collection("bookReviews")
        .orderBy('postedTimestamp', descending: true)
        .get()
        .then((value) {
      //print(value.size);
      for (var element in value.docs) {
        final book = BookReview.fromJson(element.data());
        book.id = element.id;
        //print(food.id);
        books.add(book);
        update();
      }
    });
    return books;
    
  }
  Future deleteReview(BookReview bookReview) async{
    await firestore.collection('bookReviews').doc(bookReview.id).delete();
    Get.offAllNamed(Routes.MAIN);

  }



  Future<void> incrementLike(String reviewId) async {
    firestore
        .collection("bookReviews")
        .doc(reviewId)
        .update({"likes": FieldValue.increment(1)});
        update();
  }

 

}
