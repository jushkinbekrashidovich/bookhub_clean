import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../core/custom_widgets/profile_items.dart';
import '../../../core/theme/app_colors.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Profile'),
      ),
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.only(),
            color: Colors.white,
            height: 130,
            child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 70, right: 30),
                    height: 70,
                    width: 300,
                    child: Text(
                      "Bekniyozov Jo'shqinbek",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 24),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'jushqinbekbekniyozov@gmail.com',
                    style: TextStyle(fontSize: 15, color: Colors.grey),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.9,
            height: 300,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(16)),
            child: Column(
              children: [
                ProfileItems(
                  text: 'Edit Profile',
                  icon: Icon(CupertinoIcons.person, color: AppColors.mainColor,),
                  link: () {
                    Get.toNamed('/edit-profile');
                  },
                ),
                Divider(),
                ProfileItems(
                  text: 'My Dashboard',
                  icon: Icon(CupertinoIcons.square_list, color: AppColors.mainColor,),
                  link: () {
                   // Get.toNamed(AppRoutes.editprofile);
                  },
                ),
                Divider(),
                ProfileItems(
                  text: 'Settings',
                  icon: Icon(CupertinoIcons.settings, color: AppColors.mainColor,),
                  link: () {
                   // Get.toNamed(AppRoutes.editprofile);
                  },
                ),
                Divider(),
                ProfileItems(
                  text: 'Rate ',
                  icon: Icon(
                    CupertinoIcons.star,
                  color: AppColors.mainColor,
                  ),
                  link: () {
                    //Get.toNamed(AppRoutes.editprofile);
                  },
                ),
                Divider(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
