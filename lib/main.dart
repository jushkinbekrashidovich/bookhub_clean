import 'package:bookhub/app/modules/splash/bindings/splash_binding.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/core/theme/app_theme.dart';
import 'app/routes/app_pages.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    GetMaterialApp(
      title: "bookhub",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      initialBinding: SplashBinding(),
      theme: AppThemes.light,
      darkTheme: AppThemes.dark,
      debugShowCheckedModeBanner: false,
    ),
  );
}
