
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/custom_widgets/custom_snackbar/custom_snackbar.dart';
import '../../../data/models/new_books_model.dart';

class BookhubShopController extends GetxController {
  //TODO: Implement HomeController
  late FirebaseFirestore firestore;
  final newBookSales = <NewBooks>[].obs;
  final isLoading = true.obs;
  final scrollController = ScrollController();

  void scrollUp(){
  final double start = 0;
  scrollController.animateTo(start, duration: Duration(seconds: 1), curve: Curves.easeIn);
 }
  @override
  void onInit() {
    firestore = FirebaseFirestore.instance;
    super.onInit();
  }

  @override
  void onReady() async{
    isLoading.value = true;
    try {
       newBookSales.value = await fetchBooks();
    } catch (err) {
      showErrorSnackbar(
          "Error while fetching foods from server: " + err.toString());
      throw err;
    }
    isLoading.value = false;
    super.onReady();
  }

  @override
  void onClose() {}

  Future<List<NewBooks>> fetchBooks() async {
    final List<NewBooks> newbooks = [];
    await firestore
        .collection("newbooks")
        .get()
        .then((value) {
      //print(value.size);
      value.docs.forEach((element) {
        final book = NewBooks.fromJson(element.data());
        book.id = element.id;
        //print(food.id);
        newbooks.add(book);
      });
    });
    return newbooks;
  }
}
