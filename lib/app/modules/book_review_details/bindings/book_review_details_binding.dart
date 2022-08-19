import 'package:get/get.dart';

import '../controllers/book_review_details_controller.dart';

class BookReviewDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BookReviewDetailsController>(
      () => BookReviewDetailsController(),
    );
  }
}
