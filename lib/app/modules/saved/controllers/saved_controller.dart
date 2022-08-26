import 'package:bookhub/app/data/new_books_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../../core/custom_widgets/custom_snackbar/custom_snackbar.dart';
import '../../../data/book_model.dart';

class SavedController extends GetxController {
  //TODO: Implement HomeController
  late FirebaseFirestore firestore;
  final newBookSales = <NewBooks>[].obs;
  final isLoading = true.obs;

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
        .orderBy('order',)
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
