import 'package:get/get.dart';

import '../controllers/bookhub_shop_details_controller.dart';

class BookhubShopDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BookhubShopDetailsController>(
      () => BookhubShopDetailsController(),
    );
  }
}
