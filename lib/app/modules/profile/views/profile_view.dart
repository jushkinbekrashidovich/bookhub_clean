import 'package:bookhub/app/routes/app_pages.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';

import '../../../core/custom_widgets/custom_widgets/profile_items.dart';
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
        body: GetBuilder<ProfileController>(
            builder: (controller) => Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.only(),
                      color: Colors.white,
                      height: 180,
                      child: Padding(
                        padding:
                            const EdgeInsets.only(left: 10, right: 10, top: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          //mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CachedNetworkImage(
                              imageBuilder: (context, imageProvider) =>
                                  Container(
                                width: 80.0,
                                height: 80.0,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: imageProvider, fit: BoxFit.cover),
                                ),
                              ),
                              imageUrl: controller
                                  .firebaseAuth.currentUser!.photoURL
                                  .toString(),
                              placeholder: (context, url) =>
                                  CircularProgressIndicator(
                                strokeWidth: 2,
                              ),
                              errorWidget: (context, url, error) =>
                                  Icon(Icons.error),
                            ),
                            Container(
                              //color: Colors.blue,
                              // padding: EdgeInsets.only(left: 20, right: 20),
                              height: 60,
                              width: 300,
                              child: Center(
                                child: Text(
                                  controller
                                      .firebaseAuth.currentUser!.displayName
                                      .toString(),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              controller.firebaseAuth.currentUser!.email
                                  .toString(),
                              style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: 240,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16)),
                      child: Column(
                        children: [
                          // ProfileItems(
                          //   text: 'Edit Profile',
                          //   icon: Icon(
                          //     CupertinoIcons.person,
                          //     color: AppColors.mainColor,
                          //   ),
                          //   link: () {
                          //     Get.toNamed('/edit-profile');
                          //   },
                          // ),
                          // Divider(),
                          ProfileItems(
                            text: 'My Dashboard',
                            icon: Icon(
                              CupertinoIcons.square_list,
                              color: AppColors.mainColor,
                            ),
                            link: () {
                              // Get.toNamed(AppRoutes.editprofile);
                            },
                          ),
                          Divider(),
                          ProfileItems(
                            text: 'Settings',
                            icon: Icon(
                              CupertinoIcons.settings,
                              color: AppColors.mainColor,
                            ),
                            link: () {
                              Get.toNamed(Routes.SETTINGS);
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
                )));
  }
}
