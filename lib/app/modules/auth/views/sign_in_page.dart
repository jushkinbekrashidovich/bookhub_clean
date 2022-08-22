import 'package:bookhub/app/core/custom_widgets/custom_button/custom_button.dart';
import 'package:bookhub/app/modules/auth/controllers/sign_in_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';

import '../../../core/theme/app_colors.dart';
import '../controllers/auth_controller.dart';

class SignInView extends GetView<SignInController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.background,
        automaticallyImplyLeading: false,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,

        children: [
          Container(
            height: 105,
            //color: Colors.blue,
            padding: EdgeInsets.only(top: 12, left: 15, right: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const[
                Text(
                  'Welcome to Bookhub',
                  style: TextStyle(fontSize: 23, color: AppColors.mainColor),
                ),
                Text(
                  'We happy to see you. If you have already account you can sign in, otherwise register first',
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.w300),
                ),
              ],
            ),
          ),

          Container(
            height: 120,
            //color: Colors.blue,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  height: 50,
                  width: MediaQuery.of(context).size.width*0.8,
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
                          child: SvgPicture.asset('assets/svg/google.svg')),
                      SizedBox(
                        width: 10,
                      ),
                      Text('Sign in with Google'),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  height: 50,
                  width: MediaQuery.of(context).size.width*0.8,
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
                          child: SvgPicture.asset('assets/svg/facebook.svg')),
                      SizedBox(
                        width: 10,
                      ),
                      Text('Sign in with Facebook'),
                    ],
                  ),
                ),
              ],
            ),
          ),
          RichText(
              text:
                  TextSpan(style: TextStyle(color: AppColors.black), children: [
            TextSpan(
              text: "Don't have an account?",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),

            TextSpan(
              
              text: 'Sign up',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.mainColor,
                decoration: TextDecoration.underline,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () async {
                  return await Get.offNamed('/auth');
                },
            ),
          ])),
          
        ],
      ),
    );
  }
}
