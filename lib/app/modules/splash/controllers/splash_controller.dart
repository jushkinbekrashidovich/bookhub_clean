import 'package:get/get.dart';

class SplashController extends GetxController {
  //TODO: Implement SplashController

  @override
  Future<void> onInit() async {
    super.onInit();
    await Future.delayed(
      const Duration(milliseconds: 1500),
      () {
        Get.offNamed("/auth");
      },
    );
  }
  
  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }
  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}
