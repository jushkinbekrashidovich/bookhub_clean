import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../core/theme/app_colors.dart';
import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(

      builder:(controller) => Scaffold(
          body: Center(
            child: Text(
              'bookhub',
              style: TextStyle(color: AppColors.mainColor, fontSize: 49),
            ),
          )),
    );
  }
}
