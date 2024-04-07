import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../res/routes/names.dart';

class LoginController extends GetxController {
  final formField = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  signUserIn() async {
    Get.offAndToNamed(AppRoutes.NAV_BAR);
  }
  toPageSignUp() async {
    Get.offAndToNamed(AppRoutes.SIGN_UP);
  }
  toPageForgotPass()async{
    Get.toNamed(AppRoutes.FORGOT_PASSWORD);
  }
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }
}