import 'package:bookhub/app/data/models/order_books_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../core/custom_widgets/custom_snackbar/custom_snackbar.dart';
import '../../../routes/app_pages.dart';

class OrderBooksController extends GetxController {
  //TODO: Implement OrderBooksController
  TextEditingController userNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController bookTitleController = TextEditingController();
  
  

  Future<void> upload() async {
    OrderBooks orderBooks = OrderBooks();

    
    orderBooks.bookTitle = bookTitleController.text;
    orderBooks.phoneNumber = phoneNumberController.text;
    orderBooks.userName = userNameController.text;
    orderBooks.postedTimestamp = DateTime.now().millisecondsSinceEpoch;

    await FirebaseFirestore.instance
        .collection("order_books")
        .add(orderBooks.toJson())
        .then((value) {

          // showCupertinoDialog(
          //               barrierDismissible: true,
          //               context: context,
          //               builder: (context) {
          //                 return CupertinoAlertDialog(
          //                   content: Text(
          //                     "Select language".tr,
          //                     style: TextStyle(fontSize: 20),
          //                   ),
          //                   actions: [
          //                     CupertinoDialogAction(
          //                         child: Text("O'zbekcha"),
          //                         onPressed: () {
                                    
          //                           Get.back();
          //                         }),
          //                   ],
          //                 );
          //               });
       
      
      
    Get.offAllNamed(Routes.MAIN,);
    }).catchError((err) {
      // Get.back();
      showErrorSnackbar(err.toString());
    });
  }

validation() async{
     if ( phoneNumberController.text.isEmpty) {
       Get.snackbar("Error", "Please enter your phone number", );
       return false;
     }
     if ( userNameController.text.isEmpty) {
       Get.snackbar("Error", "Please enter your name", );
       return false;
     }
     if ( bookTitleController.text.isEmpty) {
       Get.snackbar("Error", "Please enter the book title", );
       return false;
     }
    upload();
  }

  
  @override
  void onInit() {
    super.onInit();

    //showCupertinoDialog(context: context, builder: builder)
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
