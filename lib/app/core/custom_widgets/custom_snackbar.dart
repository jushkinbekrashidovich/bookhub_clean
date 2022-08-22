
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;

void showErrorSnackbar(String errorMsg, {int timeout: 2500}) {
  Get.snackbar(
    "error",
    errorMsg,
    colorText: Colors.white,
    margin: EdgeInsets.fromLTRB(10, 30, 10, 10),

    barBlur: 0,
    dismissDirection: DismissDirection.horizontal,
    duration: Duration(milliseconds: timeout),

    //instantInit: true,
    //shouldIconPulse: true,
    animationDuration: Duration(milliseconds: 300),
    icon: Icon(
      Icons.cancel,
      color: Colors.white,
      size: 35,
    ),
    snackPosition: SnackPosition.TOP,
    backgroundColor: Colors.red,
  );
}

void showSuccessSnackbar(String successMsg, {int timeout = 2500}) {
  Get.snackbar(
    "info",
    successMsg,
    borderColor: Colors.black,
    boxShadows: [
      BoxShadow(
        color: Colors.black12,
        blurRadius: 5.0,
        offset: Offset(0.0, 4.0),
      ),
    ],
    colorText: Colors.black,
    margin: EdgeInsets.fromLTRB(10, 30, 10, 10),

    barBlur: 0,
    dismissDirection: DismissDirection.horizontal,
    duration: Duration(milliseconds: timeout),

    //instantInit: true,
    //shouldIconPulse: true,
    animationDuration: Duration(milliseconds: 300),
    icon: Icon(
      Icons.done,
      color: Colors.green,
      size: 35,
    ),
    snackPosition: SnackPosition.TOP,
    backgroundColor: Colors.white,
  );
}
