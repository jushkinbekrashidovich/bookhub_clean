import 'package:bookhub/app/modules/home/controllers/home_controller.dart';
import 'package:bookhub/app/modules/splash/controllers/splash_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  //TODO: Implement ProfileController
 
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  @override
  void onInit() async{

    super.onInit();
    update();

  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  // void logout ()async{
  //   await splashController.googleSignIn.disconnect();
  //   await splashController.firebaseAuth.signOut();

  // }
  
}
