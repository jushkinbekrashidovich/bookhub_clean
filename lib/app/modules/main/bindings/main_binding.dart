import 'package:bookhub/app/data/models/book_review_model.dart';
import 'package:bookhub/app/modules/add_book/controllers/add_book_controller.dart';
import 'package:bookhub/app/modules/book_review/controllers/book_review_controller.dart';
import 'package:bookhub/app/modules/bookhub_shop/controllers/bookhub_shop_controller.dart';
import 'package:bookhub/app/modules/categories/controllers/categories_controller.dart';
import 'package:bookhub/app/modules/home/controllers/home_controller.dart';
import 'package:get/get.dart';

import '../controllers/main_controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    // Get.lazyPut<MainController>(
    //   () => MainController(),
    // );
    Get.put<MainController>(MainController());
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.put<BookReviewController>(BookReviewController());
    
    Get.lazyPut<CategoriesController>(
      () => CategoriesController(),
    );
    Get.lazyPut<BookhubShopController>(
      () => BookhubShopController(),
    );

  }
}
