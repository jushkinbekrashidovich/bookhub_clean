import 'dart:io';

import 'package:bookhub/app/routes/app_pages.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

import '../../../core/custom_widgets/custom_snackbar/custom_snackbar.dart';
import 'package:uuid/uuid.dart';

import '../../../data/models/book_model.dart';

class AddBookController extends GetxController {
  //TODO: Implement AddBookController
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController locationControlller = TextEditingController();
  List<String> categories = [
    "educational",
    "self-improvement".tr,
    'textbook'.tr,
    'language'.tr,
    'fiction'.tr,
    'novel'.tr,
    "IT".tr,
    "business".tr,
    'other'.tr
  ];
  final category = "educational".obs;
  XFile? image;
  final isExchange = false.obs;
  final didImageSelected = false.obs;

  @override
  void onInit() {
    super.onInit();
    
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  Future<void> addBook() async {
    var imageUrl = "no";
    Book book = Book();
    book.photoUrl = " ";
    book.title = titleController.text;
    book.category = category.value;
    book.location = locationControlller.text;
    book.description = descriptionController.text;
    book.phoneNumber = phoneNumberController.text;
    book.price = priceController.text;
    book.postedTimestamp = DateTime.now().millisecondsSinceEpoch;
    String refImage = 'postImages/${const Uuid().v4()}.jpg';
    book.ref = refImage;
    // book.isExchange = isExchange.value;

    if (image != null) {

      firebase_storage.FirebaseStorage storage =
          await firebase_storage.FirebaseStorage.instance;
      print("Instance got");
      // int ced = await image!.length();
      await firebase_storage.FirebaseStorage.instance
          .ref(refImage)
          .putFile(File(image!.path))
          .then((p0) async {
        imageUrl = await p0.ref.getDownloadURL();
      }).catchError((onError) {
        //Get.back();
        //showErrorSnackbar(onError.toString());
      });
      print("Image url: " + imageUrl);
    }

    final currUser = FirebaseAuth.instance.currentUser!;
    book.userId = currUser.uid;
    book.ownerName = currUser.displayName;
    book.photoUrl = imageUrl == "" ? null : imageUrl;

    FirebaseFirestore.instance
        .collection("books")
        .add(book.toJson())
        .then((value) {
      Get.offAllNamed(Routes.MAIN);
      //showSuccessSnackbar("Book added");
    }).catchError((err) {
      // Get.back();
      showErrorSnackbar(err.toString());
    });
  }

  Future<void> pickImage() async {
    print("Picking image");
    await ImagePicker()
        .pickImage(imageQuality: 50, source: ImageSource.gallery)
        .then((value) => {
              if (value != null)
                {
                  image = value,
                  print("image picked"),
                  didImageSelected.value = true
                }
            })
        .catchError((onError) {
      Get.snackbar("Error", onError.toString());
    });
    print("image picking finished");
  }

  validation() async {
    if (didImageSelected.isFalse) {
      Get.snackbar(
        "Xatolik",
        "Rasm yuklanmadi",
      );
      return false;
    }
    if (titleController.text.isEmpty) {
      Get.snackbar(
        "Xatolik",
        "Kitob nomi kiritilmadi",
      );
      return false;
    }
    if (locationControlller.text.isEmpty) {
      Get.snackbar(
        "Xatolik",
        "Manzil kititilmadi",
      );
      return false;
    }
    if (descriptionController.text.isEmpty) {
      Get.snackbar(
        "Xatolik",
        "Kitob tavsifi kiritilmadi",
      );
      return false;
    }
    if (phoneNumberController.text.isEmpty) {
      Get.snackbar(
        "Xatolik",
        "Telefon raqami kiritilmadi",
      );
      return false;
    }
    if (priceController.text.isEmpty) {
      Get.snackbar(
        "Xatolik",
        "Kitob narxi yoki nomi kiritilmadi",
      );
      return false;
    }

    if (didImageSelected.isFalse) {
      Get.snackbar(
        "Xatolik",
        "Please enter description",
      );
      return false;
    }
    addBook();
  }
}
