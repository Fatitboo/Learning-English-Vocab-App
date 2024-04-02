import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../res/routes/names.dart';

class SignUpController extends GetxController {

  toPageSignIn() async {
    Get.offAndToNamed(AppRoutes.INITIAL);
  }
  void signUserUp(){
    Get.offAndToNamed(AppRoutes.HOME);
  }
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }
}