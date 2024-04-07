import 'package:client/common_widget/bottom_navigate/bottom_navigate_controller.dart';
import 'package:get/get.dart';

class BottomNavigateBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<BottomNavigateController>(() => BottomNavigateController());
  }
}