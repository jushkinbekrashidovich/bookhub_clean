import 'package:get/get.dart';

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
