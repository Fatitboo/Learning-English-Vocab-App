import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../res/routes/names.dart';

class SignUpController extends GetxController {
  final formField = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPassController = TextEditingController();

  toPageSignIn() async {
    Get.offAndToNamed(AppRoutes.SIGN_IN);
  }
   signUserUp() async {
    Get.offAndToNamed(AppRoutes.HOME);
  }
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }
}