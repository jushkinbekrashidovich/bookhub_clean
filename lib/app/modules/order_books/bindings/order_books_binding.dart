import 'package:get/get.dart';

import '../controllers/order_books_controller.dart';

class OrderBooksBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OrderBooksController>(
      () => OrderBooksController(),
    );
  }
}
