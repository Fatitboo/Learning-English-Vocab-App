
import 'package:get/get.dart';

class LearningVocabularyController extends GetxController {
  LearningVocabularyController();
  int _a = 5;
  int get a => _a;

  void increase() {
    _a++;
    update();
    print(a);
  }
}