import 'package:get/get.dart';

class PasswordManagementController extends GetxController {
  var obscurePassword = true.obs; // Có thể sử dụng Obx để theo dõi thay đổi
  var obscureNewPassword = true.obs;
  var obscureConfirmNewPassword = true.obs;
  var currentPass = "pass hiện tại".obs;
  var newPass = "".obs;
  var confirmNewPass = "".obs;

  void toggleObscurePassword() {
    obscurePassword.toggle();
    update();
  }

  void toggleObscureNewPassword() {
    obscureNewPassword.toggle();
    update();
  }

  void toggleObscureConfirmNewPassword() {
    obscureConfirmNewPassword.toggle();
    update();
  }

  void setCurrentPassword(String value) {
    currentPass.value = value;
    update();
  }

  void setNewPassword(String value) {
    newPass.value = value;
    update();
  }

  void setConfirmNewPassword(String value) {
    confirmNewPass.value = value;
    update();
  }
}
