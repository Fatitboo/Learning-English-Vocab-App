import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../res/data/network_api_service.dart';
import '../../res/routes/names.dart';

class PasswordManagementController extends GetxController {
  bool obscureNewPassword = true;
  bool obscureConfirmNewPassword = true;
  TextEditingController newPass = TextEditingController();
  TextEditingController confirmNewPass = TextEditingController();


  void toggleObscureNewPassword() {
    obscureNewPassword = !obscureNewPassword;
    update();
  }

  void toggleObscureConfirmNewPassword() {
    obscureConfirmNewPassword = !obscureConfirmNewPassword;
    update();
  }

  Future<void> changePassword() async {
    try {
      var responseCurrentUser = await NetworkApiService().getApi(
          "/user/current-user");
      if (responseCurrentUser.statusCode == 200) {
        var currentUserData = jsonDecode(responseCurrentUser.body);
        var username = currentUserData['username'];
        var information = {
          'username': username.trim(),
          'password': confirmNewPass.text.trim(),
        };
        String jsonBody = jsonEncode(information);
        Object object = jsonEncode(information);
        http.Response postApi = await NetworkApiService().postApi(
            "/user/reset-password", object);
        if (postApi.statusCode == 200) {
          Get.defaultDialog(radius: 8,
              title: "Change password successfully!",
              middleText: "Please login to use app.",
              textConfirm: "OK",
              onConfirm: () {
                Get.toNamed(AppRoutes.PRIVATE_INFO_MANAGER);
              });
        } else {
          Get.snackbar("Bad Request", jsonDecode(postApi.body).message,
            icon: const Icon(Icons.person, color: Colors.white),
            snackPosition: SnackPosition.BOTTOM,);
        }
      }
    } on Exception catch (e) {
      Get.snackbar("Error", e.toString(),
        icon: const Icon(Icons.person, color: Colors.white),
        snackPosition: SnackPosition.BOTTOM,);
    }
  }
}
