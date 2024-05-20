import 'package:client/view/learning_vocabulary/round_learn/round_learn_controller.dart';
import 'package:get/get.dart';

import 'exam_controller.dart';

class ExamBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<ExamController>(() => ExamController());
  }
}