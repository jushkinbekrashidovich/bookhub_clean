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
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.background,
        automaticallyImplyLeading: false,
      ),
      body: GetBuilder<AuthController>(
          builder: (controller) => (Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: 105,
                    //color: Colors.blue,
                    padding: EdgeInsets.only(top: 12, left: 15, right: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          'Welcome to Bookhub',
                          style: TextStyle(
                              fontSize: 23, color: AppColors.mainColor),
                        ),
                        Text(
                          'We happy to see you. If you have already account you can sign in, otherwise register first',
                          style: TextStyle(
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
                                    child: SvgPicture.asset(
                                        'assets/svg/google.svg')),
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
