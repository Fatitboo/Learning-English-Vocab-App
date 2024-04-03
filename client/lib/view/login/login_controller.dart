import 'package:get/get.dart';

import '../../../res/routes/names.dart';

class LoginController extends GetxController {



  void signUserIn() {
    Get.offAndToNamed(AppRoutes.HOME);
  }
  toPageSignUp() async {
    Get.offAndToNamed(AppRoutes.SIGN_UP);
  }
}