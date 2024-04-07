import 'package:client/view/private_info_management/private_info_management_controller.dart';
import 'package:get/get.dart';


class PrivateInfoManagementBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<PrivateInfoManagementController>(() => PrivateInfoManagementController());
  }
}