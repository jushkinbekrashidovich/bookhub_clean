import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../core/custom_widgets/custom_button/custom_button.dart';
import '../../../core/theme/app_colors.dart';
import '../controllers/add_book_review_controller.dart';

class AddBookReviewView extends GetView<AddBookReviewController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add your book'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 13,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.9,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.white),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      const Text('Title'),
                      SizedBox(
                        height: 10,
                      ),
                    const  SizedBox(
                            height: 48,
                            child: TextField(
                              keyboardType: TextInputType.number,
                             // controller: controller.ageController,
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
                      SizedBox(
                        height: 20,
                      ),
                      const Text('Description'),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.9,
                        child: TextFormField(
                          //controller: controller.description,
                          maxLines: 8,
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.only(
                              left: 10,
                              top: 10,
                            ),
                            filled: true,
                           // fillColor: black4,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(12),
                              ),
                              gapPadding: 0,
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20,),
                     CustomButton(onTap: (){}, txt: 'submit'),
                     SizedBox(height: 20,),
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
