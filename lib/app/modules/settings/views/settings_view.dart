import 'package:bookhub/app/core/custom_widgets/profile_items.dart';
import 'package:bookhub/app/core/theme/app_colors.dart';
import 'package:bookhub/app/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

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
                  height: 350,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16)),
                  child: Column(
                    children: [
                      ProfileItems(
                          text: 'Language',
                          icon: const Icon(
                            Icons.language,
                            color: AppColors.mainColor,
                          ),
                          link: () {
                            showCupertinoModalPopup(
                                context: context,
                                builder: (context) => CupertinoActionSheet(
                                      actions: [
                                        CupertinoActionSheetAction(
                                          child: Text("O'zbekcha"),
                                          onPressed: () async{
                                           // controller.changeLanguage('uz', 'UZ');
                                           Get.updateLocale(Locale('uz','UZ'));
                                          },
                                        ),
                                        CupertinoActionSheetAction(
                                          child: Text('English'),
                                          onPressed: () {
                                            controller.changeLanguage('en', 'EN');
                                          },
                                        ),
                                        CupertinoActionSheetAction(
                                          child: Text('Русский'),
                                          onPressed: () {
                                            controller.changeLanguage('ru', 'RU');
                                          },
                                        ),
                                      ],
                                      cancelButton: CupertinoActionSheetAction(
                                        child: Text('Cancel'),
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                      ),
                                    ));
                          }),
                      const Divider(),
                      ProfileItems(
                          text: 'Theme',
                          icon: const Icon(
                            Icons.settings_display_outlined,
                            color: AppColors.mainColor,
                          ),
                          link: () {
                            showCupertinoModalPopup(
                                context: context,
                                builder: (context) => CupertinoActionSheet(
                                      actions: [
                                        CupertinoActionSheetAction(
                                          child: Container(
                                            padding: EdgeInsets.only(right: 25),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Icon(
                                                  Icons.light_mode_outlined,
                                                ),
                                                SizedBox(
                                                  width: 20,
                                                ),
                                                Text('Light')
                                              ],
                                            ),
                                          ),
                                          onPressed: () {
                                            Get.changeThemeMode(ThemeMode.light);
                                          },
                                        ),
                                        CupertinoActionSheetAction(
                                          
                                          child: Container(
                                            padding: EdgeInsets.only(right: 25),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Icon(Icons.dark_mode_outlined),
                                                SizedBox(
                                                  width: 20,
                                                ),
                                                Text('Dark')
                                              ],
                                            ),
                                          ),
                                          onPressed: () {
                                            Get.changeThemeMode(ThemeMode.light);
                                          },
                                        ),
                                      ],
                                      cancelButton: CupertinoActionSheetAction(
                                        child: Text('Cancel'),
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                      ),
                                    ));
                          }),
                      Divider(),
                      ProfileItems(
                        text: 'Support team', 
                        icon: Icon(Icons.headset_mic_outlined ,color: AppColors.mainColor,), 
                        link: () {

                        }
                        ),
                      
                      Divider(),
                      ProfileItems(
                          text: 'Delete account',
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
