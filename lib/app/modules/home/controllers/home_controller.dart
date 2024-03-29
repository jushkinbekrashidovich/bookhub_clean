import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_storage/firebase_storage.dart';

import '../../../core/custom_widgets/custom_snackbar/custom_snackbar.dart';
import '../../../data/models/ads_model.dart';
import '../../../data/models/book_model.dart';
import '../../../routes/app_pages.dart';
import 'package:uuid/uuid.dart';

class HomeController extends GetxController {

  final scrollController = ScrollController();

  //TODO: Implement HomeController
  final segmentedControlGroupValue = 0.obs;
  late FirebaseFirestore firestore;
  final bookSales = <Book>[].obs;
  final isLoading = true.obs;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final allAds = <Ads>[].obs;
  
 

 void scrollUp(){
  final double start = 0;
  scrollController.animateTo(start, duration: Duration(seconds: 1), curve: Curves.easeIn);
 }

void changeLanguage (var param1, var param2){
    var locale = Locale(param1, param2);
    Get.updateLocale(locale);
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
       bookSales.value = await fetchBooks();
       allAds.value = await fetchAdds();

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

  Future<List<Book>> fetchBooks() async {
    final List<Book> books = [];
    await firestore
        .collection("books")
        .orderBy('postedTimestamp', descending: true)
        .get()
        .then((value) {
      value.docs.forEach((element) {
        final book = Book.fromJson(element.data());
        book.id = element.id;
        books.add(book);
      });
    });
    return books;
  }

  Future<List<Ads>> fetchAdds() async {
    final List<Ads> ads = [];
    await firestore
        .collection("ads")
        .get()
        .then((value) {
      value.docs.forEach((element) {
        final ad = Ads.fromJson(element.data());
        ad.id = element.id;
        ads.add(ad);
      });
    });
    return ads;
  }
  


  
  Future deletePost(Book book,) async{
    if (book.photoUrl != null) {
     FirebaseStorage.instance.ref(book.ref).delete();


    print('image deleted');
  }

    await firestore.collection('books').doc(book.id).delete();
    Get.offAllNamed(Routes.MAIN);

  }
  
  
}
