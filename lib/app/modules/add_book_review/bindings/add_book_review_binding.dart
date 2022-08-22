import 'package:get/get.dart';

import '../controllers/add_book_review_controller.dart';

class AddBookReviewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddBookReviewController>(
      () => AddBookReviewController(),
    );
  }
}
