import 'package:client/view/detail_topic/detail_topic_controller.dart';
import 'package:get/get.dart';

class DetailTopicBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<DetailTopicController>(() => DetailTopicController());
  }
}