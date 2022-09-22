
import 'package:bookhub/app/modules/add_book/bindings/add_book_binding.dart';
import 'package:bookhub/app/modules/splash/bindings/splash_binding.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'app/core/theme/app_theme.dart';
import 'app/core/translation/app_translations.dart';
import 'app/routes/app_pages.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await GetStorage.init();

  runApp(
    GetMaterialApp(
      
      title: "bookhub",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      initialBinding: SplashBinding(),
      translations: AppTranslations(),
      locale: const Locale('en', 'EN'),
      fallbackLocale: const Locale('uz', 'UZ'),
      theme: AppThemes.light,
      //darkTheme: AppThemes.dark,
      debugShowCheckedModeBanner: false,
    ),
  );
}
