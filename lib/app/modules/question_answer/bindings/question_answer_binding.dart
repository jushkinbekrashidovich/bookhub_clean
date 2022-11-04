import 'package:get/get.dart';

import '../controllers/question_answer_controller.dart';

class QuestionAnswerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<QuestionAnswerController>(
      () => QuestionAnswerController(),
    );
  }
}
