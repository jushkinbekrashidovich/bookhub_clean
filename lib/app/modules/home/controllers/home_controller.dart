import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:firebase_storage/firebase_storage.dart';

import '../../../core/custom_widgets/custom_snackbar/custom_snackbar.dart';
import '../../../data/models/book_model.dart';
import '../../../routes/app_pages.dart';
import 'package:uuid/uuid.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController
  final segmentedControlGroupValue = 0.obs;
  late FirebaseFirestore firestore;
  final bookSales = <Book>[].obs;
  final isLoading = true.obs;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

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
  


  
  Future deletePost(Book book,) async{
    if (book.photoUrl != null) {
    await FirebaseStorage.instance.ref(book.ref).delete();


    print('image deleted');
  }

    await firestore.collection('books').doc(book.id).delete();
    Get.offAllNamed(Routes.MAIN);

  }
  
}
