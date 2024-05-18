import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class PasswordManagementController extends GetxController {
  bool obscurePassword = true; // Có thể sử dụng Obx để theo dõi thay đổi
  bool obscureNewPassword = true;
  bool obscureConfirmNewPassword = true;
  TextEditingController currentPass = TextEditingController();
  TextEditingController newPass = TextEditingController();
  TextEditingController confirmNewPass = TextEditingController();

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
}
