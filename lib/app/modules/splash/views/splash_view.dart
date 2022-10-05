import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/theme/app_colors.dart';
import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
      builder: (controller) => Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: AppColors.mainColor,
        ),
        body: Container(
          color: AppColors.mainColor,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(8)),
                  height: 50,
                  width: 50,
                  child: Center(
                      child: Icon(
                    CupertinoIcons.book,
                    color: AppColors.mainColor,
                    size: 38,
                  )),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'bookhub',
                  style: GoogleFonts.comfortaa(
                    fontSize: 40,
                    color: AppColors.white,
                    letterSpacing: 2,
                    fontWeight: FontWeight.bold
                  ),
                ),
               SizedBox(height: 50,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
