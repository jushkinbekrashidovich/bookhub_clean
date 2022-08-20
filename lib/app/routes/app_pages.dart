import 'package:get/get.dart';

import 'package:bookhub/app/modules/add_book/bindings/add_book_binding.dart';
import 'package:bookhub/app/modules/add_book/views/add_book_view.dart';
import 'package:bookhub/app/modules/auth/bindings/auth_binding.dart';
import 'package:bookhub/app/modules/auth/views/auth_view.dart';
import 'package:bookhub/app/modules/book_review/bindings/book_review_binding.dart';
import 'package:bookhub/app/modules/book_review/views/book_review_view.dart';
import 'package:bookhub/app/modules/book_review_details/bindings/book_review_details_binding.dart';
import 'package:bookhub/app/modules/book_review_details/views/book_review_details_view.dart';
import 'package:bookhub/app/modules/categories/bindings/categories_binding.dart';
import 'package:bookhub/app/modules/categories/views/categories_view.dart';
import 'package:bookhub/app/modules/edit_profile/bindings/edit_profile_binding.dart';
import 'package:bookhub/app/modules/edit_profile/views/edit_profile_view.dart';
import 'package:bookhub/app/modules/home/bindings/home_binding.dart';
import 'package:bookhub/app/modules/home/views/home_view.dart';
import 'package:bookhub/app/modules/main/bindings/main_binding.dart';
import 'package:bookhub/app/modules/main/views/main_view.dart';
import 'package:bookhub/app/modules/profile/bindings/profile_binding.dart';
import 'package:bookhub/app/modules/profile/views/profile_view.dart';
import 'package:bookhub/app/modules/saved/bindings/saved_binding.dart';
import 'package:bookhub/app/modules/saved/views/saved_view.dart';
import 'package:bookhub/app/modules/splash/bindings/splash_binding.dart';
import 'package:bookhub/app/modules/splash/views/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.MAIN,
      page: () => MainView(),
      binding: MainBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.BOOK_REVIEW,
      page: () => BookReviewView(),
      binding: BookReviewBinding(),
    ),
    GetPage(
      name: _Paths.BOOK_REVIEW_DETAILS,
      page: () => BookReviewDetailsView(),
      binding: BookReviewDetailsBinding(),
    ),
    GetPage(
      name: _Paths.ADD_BOOK,
      page: () => AddBookView(),
      binding: AddBookBinding(),
    ),
    GetPage(
      name: _Paths.CATEGORIES,
      page: () => CategoriesView(),
      binding: CategoriesBinding(),
    ),
    GetPage(
      name: _Paths.SAVED,
      page: () => SavedView(),
      binding: SavedBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_PROFILE,
      page: () => EditProfileView(),
      binding: EditProfileBinding(),
    ),
    GetPage(
      name: _Paths.AUTH,
      page: () => AuthView(),
      binding: AuthBinding(),
    ),
  ];
}
