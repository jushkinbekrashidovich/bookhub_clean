import 'package:bookhub/app/routes/app_pages.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SplashController extends GetxController {
  //TODO: Implement SplashController

  late GoogleSignIn googleSignIn;
  var isSignIn = false.obs;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onReady() async {
    googleSignIn = GoogleSignIn();
    ever(isSignIn, handleAuthStateChanged);
    isSignIn.value = await firebaseAuth.currentUser != null;
    firebaseAuth.authStateChanges().listen((event) {
      isSignIn.value = event != null;
    });
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  void handleAuthStateChanged(isLoggedIn) async {
    await Future.delayed(
      const Duration(milliseconds: 2500),
      () {
        if (isLoggedIn) {
          Get.offAllNamed(Routes.MAIN, arguments: firebaseAuth.currentUser);
        } else {
          Get.offAllNamed(Routes.AUTH);
        }
      },
    );
  }

  //@override
  // Future<void> onInit() async {
  //   super.onInit();
  //   await Future.delayed(
  //     const Duration(milliseconds: 1500),
  //     () {
  //       Get.offNamed("/auth");
  //     },
  //   );
  // }

}
