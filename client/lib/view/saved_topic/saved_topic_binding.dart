import 'package:client/view/saved_topic/saved_topic_controller.dart';
import 'package:get/get.dart';

class SavedTopicBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<SavedTopicController>(() => SavedTopicController());
  }
}