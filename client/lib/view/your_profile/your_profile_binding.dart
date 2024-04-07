import 'package:client/view/your_profile/your_profile_controller.dart';
import 'package:get/get.dart';

class YourProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<YourProfileController>(() => YourProfileController());
  }
}