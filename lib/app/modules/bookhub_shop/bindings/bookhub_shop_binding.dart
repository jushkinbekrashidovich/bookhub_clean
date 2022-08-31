import 'package:get/get.dart';

import '../controllers/bookhub_shop_controller.dart';

class BookhubShopBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BookhubShopController>(
      () => BookhubShopController(),
    );
  }
}
