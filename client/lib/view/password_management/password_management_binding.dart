import 'package:client/view/password_management/password_management_controller.dart';
import 'package:get/get.dart';

class PasswordManagementBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PasswordManagementController>(() => PasswordManagementController());
  }
}