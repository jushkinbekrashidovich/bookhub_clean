import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../splash/controllers/splash_controller.dart';

class SettingsController extends GetxController {
  //TODO: Implement SettingsController
  SplashController splashController = Get.find<SplashController>();
 

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void logout()async{
    await splashController.googleSignIn.disconnect();
    await splashController.firebaseAuth.signOut();

  }

  void changeLanguage (var param1, var param2){
    var locale = Locale(param1, param2);
    Get.updateLocale(locale);
  }
}
