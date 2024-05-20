import 'package:client/view/learning_vocabulary/round_learn/round_learn_controller.dart';
import 'package:get/get.dart';

class RoundLearnBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<RoundLearnController>(() => RoundLearnController());
  }
}