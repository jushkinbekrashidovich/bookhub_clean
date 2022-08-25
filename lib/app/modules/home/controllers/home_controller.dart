import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../../core/custom_widgets/custom_snackbar.dart';
import '../../../data/book_model.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController
  final segmentedControlGroupValue = 0.obs;
  late FirebaseFirestore firestore;
  final bookSales = <Book>[].obs;
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
       bookSales.value = await fetchBooks();
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
      //print(value.size);
      value.docs.forEach((element) {
        final book = Book.fromJson(element.data());
        book.id = element.id;
        //print(food.id);
        books.add(book);
      });
    });
    return books;
  }
}
