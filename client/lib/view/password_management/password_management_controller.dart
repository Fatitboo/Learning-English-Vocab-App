import 'package:get/get.dart';

class PasswordManagementController extends GetxController {
  bool obscurePassword = true; // Có thể sử dụng Obx để theo dõi thay đổi
  bool obscureNewPassword = true;
  bool obscureConfirmNewPassword = true;
  String currentPass = "pass hiện tại";
  String newPass = "";
  String confirmNewPass = "";

  void toggleObscurePassword() {
    obscurePassword = !obscurePassword;
    update();
  }

  void toggleObscureNewPassword() {
    obscureNewPassword = !obscureNewPassword;
    update();
  }

  void toggleObscureConfirmNewPassword() {
    obscureConfirmNewPassword = !obscureConfirmNewPassword;
    update();
  }

  void setCurrentPassword(String value) {
    currentPass = value;
    update();
  }

  void setNewPassword(String value) {
    newPass = value;
    update();
  }

  void setConfirmNewPassword(String value) {
    confirmNewPass = value;
    update();
  }
}
