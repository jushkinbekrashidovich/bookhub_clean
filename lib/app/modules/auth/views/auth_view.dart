import 'package:bookhub/app/core/custom_widgets/custom_button/custom_button.dart';
import 'package:flutter/cupertino.dart';
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
      body: ListView(
        //crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 95,
            //color: Colors.blue,
            padding: EdgeInsets.only(top: 12, left: 15, right: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
            padding: EdgeInsets.only(left: 15, right: 15, top: 12),
            //color: Colors.blue,
            height: 240,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                 const SizedBox(
                  height: 48,
                  child: TextField(
                    keyboardType: TextInputType.emailAddress,
                    //controller: nameController,
                    
                    decoration: InputDecoration(
                      prefixIcon: Icon(CupertinoIcons.mail),
                      prefixIconColor: AppColors.background,
                      contentPadding: EdgeInsets.all(12),
                      // suffixIcon: Icon(Icons.clear_rounded),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                          gapPadding: 0,
                          borderSide: BorderSide.none),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: AppColors.mainColor),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      hintText: 'Email',
                    ),
                  ),
                ),
                const SizedBox(
                  height: 48,
                  child: TextField(
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock_outlined),
                      prefixIconColor: AppColors.background,
                      contentPadding: EdgeInsets.all(12),
                      // suffixIcon: Icon(Icons.clear_rounded),
                      filled: true,
                      fillColor: AppColors.white,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                          gapPadding: 0,
                          borderSide: BorderSide.none),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: AppColors.mainColor),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      hintText: 'Password',
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    Text(
                      'Forgot password?',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
                    ),
                  ],
                ),
                CustomButton(onTap: () {}, txt: 'Log in'),
              ],
            ),
          ),
          Divider(),
          const Padding(
            padding:  EdgeInsets.only(left: 10, right: 10, top: 10),
            child: Center(
                child: Text(
                    'Sign in with Google or Facebook', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),)),
          ),
          Container(
            height: 110,
            //color: Colors.blue,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  height: 50,
                  width: 140,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: AppColors.grey)),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                          height: 30,
                          width: 30,
                          child: SvgPicture.asset('assets/svg/google.svg')),
                      SizedBox(
                        width: 4,
                      ),
                      Text('Google'),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  height: 50,
                  width: 140,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: AppColors.grey)),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                          height: 30,
                          width: 30,
                          child: SvgPicture.asset('assets/svg/facebook.svg')),
                      SizedBox(
                        width: 4,
                      ),
                      Text('Facebook'),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Don't have an accout?", style: TextStyle(fontSize: 14),),
              SizedBox(width: 3,),
              Text("Sign up", style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold, color: AppColors.mainColor),)
            ],
          ),
          
        ],
      ),
    );
  }
}
