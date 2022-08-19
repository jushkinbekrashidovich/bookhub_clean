import 'package:get/get.dart';

import '../controllers/book_review_controller.dart';

class BookReviewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BookReviewController>(
      () => BookReviewController(),
    );
  }
}
