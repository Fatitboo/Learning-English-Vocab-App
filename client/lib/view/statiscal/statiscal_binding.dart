import 'package:client/view/statiscal/statiscal_controller.dart';
import 'package:get/get.dart';

class StatiscalBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StatiscalController>(() => StatiscalController());
  }
}