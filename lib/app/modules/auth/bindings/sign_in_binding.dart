import 'package:bookhub/app/modules/auth/controllers/sign_in_controller.dart';
import 'package:get/get.dart';

import '../controllers/auth_controller.dart';

class SignInBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignInController>(
      () => SignInController(),
    );
  }
}
