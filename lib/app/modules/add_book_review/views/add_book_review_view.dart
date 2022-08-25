import 'package:bookhub/app/core/custom_widgets/loading_widgets/custom_circular_progress_indicator.dart';
import 'package:bookhub/app/modules/book_review/bindings/book_review_binding.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
      body: GetBuilder<AddBookReviewController>(
        builder: (controller) => Center(
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
                        SizedBox(
                          height: 48,
                          child: TextFormField(

                            // inputFormatters: [
                            //   FilteringTextInputFormatter.deny(RegExp(r'\s')),
                            // ],
                            keyboardType: TextInputType.text,
                            controller: controller.titleController,
                            //  validator: (value){
                            //   return controller.validateTitle(value!);

                            //  },
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
                                  borderSide: BorderSide.none),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: AppColors.mainColor),
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
                            inputFormatters: [
                              FilteringTextInputFormatter.deny(RegExp(r'\s')),
                            ],
                            keyboardType: TextInputType.text,
                            controller: controller.descriptionController,
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
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: 48,
                          width: MediaQuery.of(context).size.width * 0.9,
                          // margin: margin,
                          child: ElevatedButton(
                            onPressed: () async{
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
                            style: ElevatedButton.styleFrom(
                              onSurface: AppColors.mainColor,
                              //primary: AppColors.mainColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ).copyWith(
                              elevation:
                                  MaterialStateProperty.resolveWith<double>(
                                (Set<MaterialState> states) {
                                  if (states.contains(MaterialState.pressed))
                                    return 0;
                                  return 0;
                                },
                              ),
                            ),
                            child: Container(
                              child: Text(
                                'Submit',
                                style: const TextStyle(
                                    color: AppColors.white, fontSize: 18),
                              ),
                            ),
                          ),
                        ),
                        // CustomButton(
                        //     onTap: () {
                        //       controller.upload();
                        //     },
                        //     txt: 'submit'),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
