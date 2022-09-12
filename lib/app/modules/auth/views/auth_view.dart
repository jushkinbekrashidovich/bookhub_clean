import 'package:bookhub/app/core/custom_widgets/custom_button/custom_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';

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
                height: 150,
                //color: Colors.blue,
                padding: EdgeInsets.only(top: 10, left: 15, right: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Welcome to Bookhub'.tr,
                      style: const TextStyle(
                          fontSize: 30, color: AppColors.mainColor),
                    ),
                    Text(
                      'We are happy to see you. Here are a bunch of features and opportunities that will encourage you to read more books.'
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
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: AppColors.grey)),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                                height: 30,
                                width: 30,
                                child:
                                    SvgPicture.asset('assets/svg/google.svg')),
                            SizedBox(
                              width: 10,
                            ),
                            Text('Sign in with Google'),
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
