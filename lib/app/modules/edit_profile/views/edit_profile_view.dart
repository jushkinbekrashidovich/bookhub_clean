import 'package:bookhub/app/modules/edit_profile/controllers/edit_profile_controller.dart';
import 'package:bookhub/app/modules/profile/controllers/profile_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../core/custom_widgets/custom_button/custom_button.dart';
import '../../../core/theme/app_colors.dart';

class EditProfileView extends GetView<EditProfileController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
      ),
      body: GetBuilder<EditProfileController>(builder: (controller) =>  Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Container(
                  height: 319,
                  width: MediaQuery.of(context).size.width * 0.9,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, top: 15, right: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:  [
                       const Padding(
                          padding: EdgeInsets.only(left: 7, bottom: 10),
                          child: Text('Name', style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w400),),
                        ),
                        SizedBox(
                          height: 48,
                          child: TextField(
                            keyboardType: TextInputType.text,
                            controller: controller.nameController,
                            onChanged: (name){
                              name = controller.nameController.text;
                              //name = controller.firebaseAuth.currentUser.updateDisplayName(co)

                            },
                            decoration:const InputDecoration(
                              contentPadding: EdgeInsets.all(12),
                              // suffixIcon: Icon(Icons.clear_rounded),
                              filled: true,
                              fillColor: Color(0xffF9F9FD),
                              border:  OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                                gapPadding: 0,
                                borderSide: BorderSide.none
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:  BorderSide(color: AppColors.mainColor),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ), 
                              ),
                              hintText: 'Ismingiz',
                            ),
                          ),
                        ),
                      const  SizedBox(height: 20,),
                       const Padding(
                          padding: EdgeInsets.only(left: 7, bottom: 10),
                          child: Text('Phone number', style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w400),),
                        ),
                        SizedBox(
                          height: 48,
                          child: TextField(
                            keyboardType: TextInputType.phone,
                            controller: controller.phoneController,
                            decoration: const InputDecoration(
                              contentPadding: EdgeInsets.all(12),
                              // suffixIcon: Icon(Icons.clear_rounded),
                              filled: true,
                              fillColor: Color(0xffF9F9FD),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                                gapPadding: 0,
                                borderSide: BorderSide.none
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:  BorderSide(color: AppColors.mainColor),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ), 
                              ),
                              hintText: '+998',
                            ),
                          ),
                        ),
                      const  SizedBox(height: 20,),
                       const Padding(
                          padding: EdgeInsets.only(left: 7, bottom: 10),
                          child: Text('Age', style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w400),),
                        ),
                        SizedBox(
                          height: 48,
                          child: TextField(
                            keyboardType: TextInputType.number,
                            controller: controller.ageController,
                            decoration:const InputDecoration(
                              contentPadding: EdgeInsets.all(12),
                              // suffixIcon: Icon(Icons.clear_rounded),
                              filled: true,
                              fillColor: Color(0xffF9F9FD),
                              border:  OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                                gapPadding: 0,
                                borderSide: BorderSide.none
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:  BorderSide(color: AppColors.mainColor),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ), 
                              ),
                              //hintText: 'age',
                            ),
                          ),
                        ),
                        const SizedBox(height: 20,),
                        
                      ],
                    ),
                  ),
                ),
              ),
             const SizedBox(height: 30,),
              CustomButton(
                onTap: (){
               //  var updatedName =controller.nameController.text;
              // Get.find<ProfileController>().firebaseAuth.currentUser!.updateDisplayName(updatedName);
               Get.back();
              }, txt: 'Save')
            ],
          ),
        ),
      ),
      ));
  }
}
