import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class TodoController extends GetxController {
  //TODO: Implement TodoController
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  TextEditingController titleOfBookcontroller = TextEditingController();

  final count = 0.obs;
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
  void increment() => count.value++;
}
