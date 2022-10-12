import 'package:bookhub/app/core/custom_widgets/custom_button/custom_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/theme/app_colors.dart';
import '../controllers/auth_controller.dart';

class AuthView extends GetView<AuthController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
      builder: (controller) => (Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: AppColors.background,
            automaticallyImplyLeading: false,
            actions: [
                 
              IconButton(
                  onPressed: () {
                    showCupertinoDialog(
                        barrierDismissible: true,
                        context: context,
                        builder: (context) {
                          return CupertinoAlertDialog(
                            content: Text(
                              "Select the theme".tr,
                              style: TextStyle(fontSize: 20),
                            ),
                            actions: [
                              CupertinoDialogAction(
                                  child: Text("O'zbekcha"),
                                  onPressed: () {
                                    controller.changeLanguage('uz', 'UZ');
                                    Get.back();
                                  }),
                              CupertinoDialogAction(
                                  child: Text('English'),
                                  onPressed: () {
                                    controller.changeLanguage('en', 'EN');
                                    Get.back();
                                  }),
                              CupertinoDialogAction(
                                  child: Text('Русский'),
                                  onPressed: () {
                                    controller.changeLanguage('ru', 'RU');
                                    Get.back();
                                  }),
                            ],
                          );
                        });
                  },
                  icon: Icon(Icons.language)),
            ],
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                height: 160,
                //color: Colors.blue,
                padding: EdgeInsets.only(top: 10, left: 15, right: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                      'Welcome to'.tr,
                      style: const TextStyle(
                          fontSize: 22, color: AppColors.mainColor),
                    ),
                    SizedBox(height: 10,),
                    Text(
                      'bookhub',
                      style: GoogleFonts.comfortaa(
                        fontSize: 34,
                        color: AppColors.mainColor,
                        letterSpacing: 2,
                        fontWeight: FontWeight.bold
                      ),
                    ),

                      ],
                    ),
                    
                    Text(
                      'Bookhub is an online marketplace application that helps people buy, sell, and exchange books. Our main goal is to give an opportunity to people to read more books.'
                          .tr,
                      style: const TextStyle(
                          fontSize: 13, fontWeight: FontWeight.w300),
                    ),
                  ],
                ),
              ),
              Container(
                height: 120,
                //color: Colors.blue,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        controller.login();
                      },
                      child: Container(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        height: 50,
                        width: MediaQuery.of(context).size.width * 0.8,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 0, 132, 255),
                            borderRadius: BorderRadius.circular(10),),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.white,
                              ),        
                              height: 35,
                              width: 35, 
                                child:SizedBox(
                                  height: 18,
                                width: 18,

                                  child: SvgPicture.asset('assets/svg/google.svg',)),
                                  ),
                            SizedBox(
                              width: 10,
                            ),
                            Text('Continue with Google'.tr, style: TextStyle(color: AppColors.white, fontSize: 15),),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ))),
    );
  }
}
