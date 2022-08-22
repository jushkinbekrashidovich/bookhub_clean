import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class MainController extends GetxController {
  //TODO: Implement MainController


 BottomMenu _bottomMenu = BottomMenu.home;
  void setMenu(BottomMenu menu) {
    _bottomMenu = menu;
    update();
  }

  BottomMenu get bottomMenu => _bottomMenu;
}
enum BottomMenu { home, saved,  reviews, categories }
