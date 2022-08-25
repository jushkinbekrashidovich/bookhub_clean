import 'package:get/get.dart';

import '../controllers/book_details_controller.dart';

class BookDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BookDetailsController>(
      () => BookDetailsController(),
    );
  }
}
