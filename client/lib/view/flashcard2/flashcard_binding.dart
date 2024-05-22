import 'package:client/view/flashcard/flashcard_controller.dart';
import 'package:get/get.dart';
class FlashCardBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<FlashCardController>(() => FlashCardController());
  }
}