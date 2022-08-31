import 'package:bookhub/app/core/custom_widgets/custom_widgets/profile_items.dart';
import 'package:bookhub/app/core/theme/app_colors.dart';
import 'package:bookhub/app/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../controllers/settings_controller.dart';

class SettingsView extends GetView<SettingsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Settings'),
        // backgroundColor: AppColors.background,
      ),
      body: GetBuilder<SettingsController>(
        builder: (controller) => Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: 230,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16)),
                  child: Column(
                    children: [
                      ProfileItems(
                          text: 'Language'.tr,
                          icon: const Icon(
                            Icons.language,
                            color: AppColors.mainColor,
                          ),
                          link: () {
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
                                            controller.changeLanguage(
                                                'uz', 'UZ');
                                            Get.back();
                                          }),
                                      CupertinoDialogAction(
                                          child: Text('English'),
                                          onPressed: () {
                                            controller.changeLanguage(
                                                'en', 'EN');
                                            Get.back();
                                          }),
                                      CupertinoDialogAction(
                                          child: Text('Русский'),
                                          onPressed: () {
                                            controller.changeLanguage(
                                                'ru', 'RU');
                                            Get.back();
                                          }),
                                    ],
                                  );
                                });
                          }),
                      const Divider(),
                      ProfileItems(
                          text: 'Support team'.tr,
                          icon: Icon(
                            Icons.headset_mic_outlined,
                            color: AppColors.mainColor,
                          ),
                          link: () async {
                             await launch("https://t.me/bookhub_support_bot");
                            
                          }),
                      Divider(),
                      ProfileItems(
                          text: 'Delete account'.tr,
                          icon: const Icon(
                            Icons.logout,
                            color: AppColors.mainColor,
                          ),
                          link: () {
                            showCupertinoDialog(
                                context: context,
                                builder: (context) {
                                  return CupertinoAlertDialog(
                                    title: Text(
                                      "Delete account?",
                                      style: TextStyle(),
                                    ),
                                    //content:  Text("Haqiqatdan chiqishni xohlaysizmi".tr),
                                    actions: [
                                      CupertinoDialogAction(
                                          child: Text(
                                            "Yes",
                                            style:
                                                TextStyle(color: AppColors.red),
                                          ),
                                          onPressed: () {
                                            controller.logout();
                                          }),
                                      CupertinoDialogAction(
                                          child: Text(
                                            "No",
                                            style: TextStyle(
                                              color: AppColors.mainColor,
                                            ),
                                          ),
                                          onPressed: () {
                                            Get.back();
                                          }),
                                    ],
                                  );
                                });
                          }),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
