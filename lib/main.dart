
import 'package:bookhub/app/modules/add_book/bindings/add_book_binding.dart';
import 'package:bookhub/app/modules/splash/bindings/splash_binding.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';

import 'app/core/theme/app_theme.dart';
import 'app/core/translation/app_translations.dart';
import 'app/routes/app_pages.dart';

import 'package:firebase_messaging/firebase_messaging.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp();

  print("Handling a background message: ${message.messageId}");
}

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();


  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
 FirebaseMessaging messaging = FirebaseMessaging.instance;

NotificationSettings settings = await messaging.requestPermission(
  alert: true,
  announcement: false,
  badge: true,
  carPlay: false,
  criticalAlert: false,
  provisional: false,
  sound: true,
);
FirebaseMessaging.onMessage.listen((RemoteMessage message) {
  print('Got a message whilst in the foreground!');
  print('Message data: ${message.data}');

  if (message.notification != null) {
    print('Message also contained a notification: ${message.notification}');
  }
});

  runApp(
    GetMaterialApp(
      
      title: "Bookhub",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      initialBinding: SplashBinding(),
      translations: AppTranslations(),
      locale: const Locale('uz', 'UZ'),
      fallbackLocale: const Locale('uz', 'UZ'),
      theme: AppThemes.light,
      //darkTheme: AppThemes.dark,
      debugShowCheckedModeBanner: false,
    ),
  );
}
