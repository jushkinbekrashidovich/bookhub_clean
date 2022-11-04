import 'package:bookhub/app/core/custom_widgets/custom_widgets/profile_items.dart';
import 'package:bookhub/app/core/theme/app_colors.dart';
import 'package:bookhub/app/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import '../controllers/question_answer_controller.dart';

class QuestionAnswerView extends GetView<QuestionAnswerController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Frequently Asked Questions'.tr),
        // backgroundColor: AppColors.background,
      ),
      body: GetBuilder<QuestionAnswerController>(
        builder: (controller) => Padding(
          padding: const EdgeInsets.only(top: 20),
          child: ListView(
            children: [
              Container(
                margin: EdgeInsets.only(left: 10, right: 10),
                padding: EdgeInsets.only(top: 6, bottom: 6),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(5)
                ),
                
                child: ExpansionTile(
                  title: Text('What is Bookhub?'.tr, style: GoogleFonts.lora(fontSize: 18),),
                  children: [
                    ListTile(title: Text('Bookhub is an online marketplace application that helps people buy, sell, and exchange books. In addition, new original books are available for an affordable price.'.tr, style: GoogleFonts.lora(fontSize: 14),)),
                  ], 
                  ),
              ),
              Divider(),
              Container(
                margin: EdgeInsets.only(left: 10, right: 10),
                padding: EdgeInsets.only(top: 6, bottom: 6),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(5)
                ),
                
                child: ExpansionTile(
                  title: Text('Is it free to sell our books through Bookhub?'.tr, style: GoogleFonts.lora(fontSize: 18),),
                  children: [
                    ListTile(title: Text('Yes, you can sell, buy and exchange your books through Bookhub.\nAnd,it is all free 😊'.tr, style: GoogleFonts.lora(fontSize: 14),),)
                  ], 
                  ),
              ),
              Divider(),
              Container(
                margin: EdgeInsets.only(left: 10, right: 10),
                padding: EdgeInsets.only(top: 6, bottom: 6),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(5)
                ),
                
                child: ExpansionTile(
                  title: Text('What is Bookshop?'.tr, style: GoogleFonts.lora(fontSize: 18),),
                  children:  [
                    ListTile(title: Text('The Bookshop belongs to Bookhub which sells original, used/good books. And we give guarantee our services and books.'.tr, style: GoogleFonts.lora(fontSize: 14),),)
                  ], 
                  ),
              ),
              Divider(),
              Container(
                margin: EdgeInsets.only(left: 10, right: 10),
                padding: EdgeInsets.only(top: 6, bottom: 6),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(5)
                ),
                
                child: ExpansionTile(
                  title: Text('How can I contact you?'.tr,  style: GoogleFonts.lora(fontSize: 18),),
                  children: [
                    ListTile(title: Text('You can contact via telegram bot: @BookhubSupportBot \nor Write directly to me @CodeRG'.tr,style: GoogleFonts.lora(fontSize: 14), ),)
                  ], 
                  ),
              ),Divider(),
                
            ],
          ),
        ),
      ),
    );
  }
}
