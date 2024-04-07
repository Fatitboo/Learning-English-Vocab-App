

import 'package:client/view/learning_vocabulary/learning_vocabulary_controller.dart';
import 'package:get/get.dart';

class DetailLearnedBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<LearningVocabularyController>(() => LearningVocabularyController());
  }
}