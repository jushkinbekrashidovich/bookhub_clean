import 'package:bookhub/app/core/custom_widgets/custom_dialogs/custom_loader_dialog.dart';
import 'package:bookhub/app/core/custom_widgets/custom_text_widgets/custom_padding_title_widget.dart';
import 'package:bookhub/app/core/custom_widgets/text_fields/custom_text_field.dart';
import 'package:bookhub/app/core/custom_widgets/text_fields/custom_text_form_field.dart';
import 'package:bookhub/app/core/theme/app_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../core/custom_widgets/custom_button/custom_button.dart';
import '../../../core/custom_widgets/custom_snackbar/custom_snackbar.dart';
import '../../../core/theme/app_colors.dart';
import '../controllers/add_book_controller.dart';

class AddBookView extends GetView<AddBookController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Add your book'.tr),
        ),
        body: Obx(
          () => ListView(
            physics: const BouncingScrollPhysics(),
            padding:
                const EdgeInsets.only(top: 10, bottom: 25, left: 10, right: 10),
            children: [
              Container(
                height: 120,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                decoration: const BoxDecoration(
                  color: AppColors.white,
                  borderRadius: AppUtils.kBorderRadius8,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(),
                       Text(
                        'Please upload an image'.tr,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 15),
                      ),
                       Text(
                        'Photo'.tr,
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey,
                            fontWeight: FontWeight.w400),
                      ),
                      GestureDetector(
                        onTap: () {
                          controller.pickImage();
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 45, vertical: 10),
                          padding: AppUtils.kAllPadding8,
                          decoration: const BoxDecoration(
                            color: Color(0xffE6F2FF),
                            borderRadius: AppUtils.kBorderRadius10,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                CupertinoIcons.photo_camera,
                                color: !controller.didImageSelected.value
                                    ? AppColors.mainColor
                                    : Colors.green,
                              ),
                              SizedBox(
                                width: 4,
                              ),
                              Text(
                                !controller.didImageSelected.value
                                    ? "Select an image".tr
                                    : "Image selected".tr,
                                style: TextStyle(
                                  color: !controller.didImageSelected.value
                                      ? AppColors.mainColor
                                      : Colors.green,
                                  fontSize: 14,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              AppUtils.kBoxHeight10,
              Container(
                decoration: const BoxDecoration(
                    color: AppColors.white,
                    borderRadius: AppUtils.kBorderRadius10),
                padding: AppUtils.kAllPadding10,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     CustomPaddingTitle(title: 'Title'.tr),
                    CustomTextField(controller: controller.titleController),
                    AppUtils.kBoxHeight10,
                    CustomPaddingTitle(title: 'Category'.tr),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 1),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Color(0xffF9F9FD),
                          borderRadius: BorderRadius.circular(10)),
                      child: DropdownButton<String>(
                          dropdownColor: AppColors.white,
                          isExpanded: true,
                          underline: Container(),
                          value: controller.category.value,
                          selectedItemBuilder: (_) {
                            return controller.categories.map((String choice) {
                              return Center(
                                child: Container(
                                  width: double.infinity,
                                  child: Text(choice),
                                ),
                              );
                            }).toList();
                          },
                          items: controller.categories.map((String choice) {
                            return DropdownMenuItem<String>(
                              value: choice,
                              child: Row(
                                children: [Text(choice)],
                              ),
                            );
                          }).toList(),
                          onChanged: (opt) {
                            controller.category.value = opt ?? 'all';
                          }),
                    ),
                    AppUtils.kBoxHeight10,
                   CustomPaddingTitle(title: 'Address'.tr),
                    CustomTextField(controller: controller.locationControlller),
                    AppUtils.kBoxHeight10,
                     CustomPaddingTitle(title: 'Description'.tr),
                    CustomTextFormField(
                        controller: controller.descriptionController,
                        maxLines: 4,
                        hintText: 'Please, write a description'.tr),
                    AppUtils.kBoxHeight10,
                    CustomPaddingTitle(title: 'Phone number'.tr),
                    CustomTextField(
                      controller: controller.phoneNumberController,
                      keyboardType: TextInputType.phone,
                      hintText: '+998',
                    ),
                    AppUtils.kBoxHeight10,
                    Container(
                      height: 48,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Color(0xffF9F9FD),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            padding: EdgeInsets.only(left: 10),
                            child: Text(
                              'Do you want to exchange your book?'.tr,
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.w400),
                            ),
                          ),
                          Spacer(),
                          Container(
                            alignment: Alignment.center,
                            height: double.infinity,
                            //width: 150,
                            child: CupertinoSwitch(
                              onChanged: (value) {
                                controller.isExchange.value = value;
                              },
                              value: controller.isExchange.value,
                              activeColor: AppColors.mainColor,
                            ),
                          )
                        ],
                      ),
                    ),
                    AppUtils.kBoxHeight10,
                    controller.isExchange.value == false
                        ?  CustomPaddingTitle(title: 'Price'.tr)
                        :  CustomPaddingTitle(title: 'Title'.tr),
                    CustomTextField(
                      hintText: controller.isExchange.value == false?'':'e.g Atomic Habits'.tr,
                      controller: controller.priceController,
                      keyboardType: TextInputType.text,
                    ),
                  ],
                ),
              ),
              AppUtils.kBoxHeight15,
              Padding(
                padding: AppUtils.kLeftandRightPadding10,
                child: CustomButton(
                  onTap: () async {
                    //CustomLoaderDialog();
                    showDialog(
                        context: context,
                        barrierDismissible: true,
                        builder: (BuildContext context) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        });
                    controller.validation();
                    // controller.addBook().then((value) {}).catchError((onError) {
                    //   Get.back();
                    //   showErrorSnackbar(onError.toString());
                    // });
                  },
                  txt: 'Submit'.tr,
                ),
              ),
            ],
          ),
        ));
  }
}
