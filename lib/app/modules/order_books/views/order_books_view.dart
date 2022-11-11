import 'package:bookhub/app/core/custom_widgets/custom_button/custom_button.dart';
import 'package:bookhub/app/core/custom_widgets/custom_text_widgets/custom_padding_title_widget.dart';
import 'package:bookhub/app/core/custom_widgets/text_fields/custom_text_field.dart';
import 'package:bookhub/app/core/custom_widgets/text_fields/custom_text_form_field.dart';
import 'package:bookhub/app/core/theme/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import '../controllers/order_books_controller.dart';

class OrderBooksView extends GetView<OrderBooksController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order books'.tr),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (_) => CupertinoAlertDialog(
                    title: Text(
                      "Order guideline".tr,
                      style: TextStyle(fontSize: 20),
                    ),
                    content: Text(
                      "If you want to order a book, please enter your details or contact us directly by telegram".tr,
                      style: GoogleFonts.lora(fontSize: 14),
                    ),
                    actions: [
                      CupertinoDialogAction(
                        isDefaultAction: true,
                        child: Text('OK'.tr),
                        onPressed: () {
                          Get.back();
                        },
                      ),
                    ],
                  ),
                );
              },
              icon: Icon(CupertinoIcons.question_circle))
        ],
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 20,
          ),
          Container(
            margin: EdgeInsets.only(left: 10, right: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColors.white,
            ),
            height: 350,
            child: Padding(
              padding: const EdgeInsets.only(top: 15, right: 10, left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomPaddingTitle(title: "Name".tr),

                  CustomTextField(
                    controller: controller.userNameController,
                    // hintText: '+998',
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CustomPaddingTitle(title: 'Phone number'.tr),
                  CustomTextField(
                    controller: controller.phoneNumberController,
                    hintText: '+998',
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CustomPaddingTitle(title: 'Title'.tr),

                  CustomTextFormField(
                      controller: controller.bookTitleController,
                      maxLines: 6,
                      hintText:
                          'e.g Clean Code, hardcover'.tr)
                  //CustomTextField(controller: ,hintText: 'I want to order Atomic Habits original because',),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Container(
              padding: EdgeInsets.only(left: 18, right: 18),
              child: CustomButton(
                  onTap: () async{
                     showDialog(
                        context: context,
                        barrierDismissible: true,
                        builder: (BuildContext context) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        });
                    controller.validation();
                  },
                  txt: "Send".tr)),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Expanded(
                child: Divider(
                  indent: 20.0,
                  endIndent: 10.0,
                  thickness: 1,
                ),
              ),
              Text(
                "OR".tr,
                style: TextStyle(color: Colors.blueGrey),
              ),
              Expanded(
                child: Divider(
                  indent: 10.0,
                  endIndent: 20.0,
                  thickness: 1,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          GestureDetector(
            onTap: ()async{
              await launch("https://t.me/bookhubshopbot");

            },
            child: Container(
              //padding: EdgeInsets.only(left: 15, right: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: AppColors.mainColor
              ),
              padding: EdgeInsets.all(8),
              margin: EdgeInsets.only(left: 10, right: 10),
              //width: 280,
              height: 47,
               child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.telegram_outlined, size: 25,color: AppColors.white,),
                    SizedBox(width: 5,),
                    Text('Telegram', style: TextStyle(color: AppColors.white, fontSize: 16),),
                    
                  ],
                ),
             ),
          ),
          SizedBox(
            height: 29,
          ),
        ],
      ),
    );
  }
}
