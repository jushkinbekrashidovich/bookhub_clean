import 'package:get/get.dart';

import 'package:bookhub/app/modules/add_book/bindings/add_book_binding.dart';
import 'package:bookhub/app/modules/add_book/views/add_book_view.dart';
import 'package:bookhub/app/modules/add_book_review/bindings/add_book_review_binding.dart';
import 'package:bookhub/app/modules/add_book_review/views/add_book_review_view.dart';
import 'package:bookhub/app/modules/auth/bindings/auth_binding.dart';
import 'package:bookhub/app/modules/auth/bindings/sign_in_binding.dart';
import 'package:bookhub/app/modules/auth/views/auth_view.dart';
import 'package:bookhub/app/modules/auth/views/sign_in_page.dart';
import 'package:bookhub/app/modules/book_details/bindings/book_details_binding.dart';
import 'package:bookhub/app/modules/book_details/views/book_details_view.dart';
import 'package:bookhub/app/modules/book_review/bindings/book_review_binding.dart';
import 'package:bookhub/app/modules/book_review/views/book_review_view.dart';
import 'package:bookhub/app/modules/book_review_details/bindings/book_review_details_binding.dart';
import 'package:bookhub/app/modules/book_review_details/views/book_review_details_view.dart';
import 'package:bookhub/app/modules/bookhub_shop/bindings/bookhub_shop_binding.dart';
import 'package:bookhub/app/modules/bookhub_shop/views/bookhub_shop_view.dart';
import 'package:bookhub/app/modules/bookhub_shop_details/bindings/bookhub_shop_details_binding.dart';
import 'package:bookhub/app/modules/bookhub_shop_details/views/bookhub_shop_details_view.dart';
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
import 'package:bookhub/app/modules/settings/bindings/settings_binding.dart';
import 'package:bookhub/app/modules/settings/views/settings_view.dart';
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
    // GetPage(
    //   name: _Paths.BOOK_REVIEW_DETAILS,
    //   page: () => BookReviewDetailsView(),
    //   binding: BookReviewDetailsBinding(),
    // ),
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
      name: _Paths.BOOKHUB_SHOP,
      page: () => BookhubShopView(),
      binding: BookhubShopBinding(),
    ),
    GetPage(
        name: _Paths.EDIT_PROFILE,
        page: () => EditProfileView(),
        binding: EditProfileBinding(),
        transition: Transition.cupertino),
    GetPage(
      name: _Paths.AUTH,
      page: () => AuthView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: _Paths.SIGN_IN,
      page: () => SignInView(),
      binding: SignInBinding(),
    ),
    GetPage(
        name: _Paths.SETTINGS,
        page: () => SettingsView(),
        binding: SettingsBinding(),
        transition: Transition.cupertino),
    GetPage(
      name: _Paths.ADD_BOOK_REVIEW,
      page: () => AddBookReviewView(),
      binding: AddBookReviewBinding(),
    ),
    // GetPage(
    //   name: _Paths.BOOK_DETAILS,
    //   page: () => BookDetailsView(),
    //   binding: BookDetailsBinding(),
    // ),
    // GetPage(
    //   name: _Paths.BOOKHUB_SHOP_DETAILS,
    //   page: () => BookhubShopDetailsView(),
    //   binding: BookhubShopDetailsBinding(),
    // ),
  ];
}
