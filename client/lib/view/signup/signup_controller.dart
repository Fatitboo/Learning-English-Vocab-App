import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:google_sign_in/google_sign_in.dart';
import '../../../res/routes/names.dart';
import '../../res/data/network_api_service.dart';
import '../../res/model/login_response.dart';
import '../../res/storage/user_storage.dart';

final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ["email"]);

class SignUpController extends GetxController {
  GoogleSignInAccount? _currentUser;

  final formField = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPassController = TextEditingController();

  toPageSignIn() async {
    Get.offAndToNamed(AppRoutes.SIGN_IN);
  }

  signUserUp() async {
    try {
      var information = {
        'username': usernameController.text.trim(),
        'password': passwordController.text.trim(),
        'email': emailController.text.trim()
      };
      Object object = jsonEncode(information);
      print(object);
      http.Response postApi =
          await NetworkApiService().postApi("/user/register", object);
      if (postApi.statusCode == 200) {
        usernameController.clear();
        passwordController.clear();
        emailController.clear();
        confirmPassController.clear();
        Get.defaultDialog(
            radius: 8,
            title: "Register successfully!",
            middleText: "Please login to use app.",
            textConfirm: "OK",
            onConfirm: () {
              Get.offAndToNamed(AppRoutes.SIGN_IN);
            });
      }
    } on Exception catch (e) {
      Get.snackbar(
        "Error",
        e.toString(),
        icon: const Icon(Icons.person, color: Colors.white),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  Future signUserInGG() async {
    try {
      var user = await _googleSignIn.signIn();
      print(user);
      var information = {
        'username': user!.id,
        'password': '1',
        "email": user.email,
        "fullname": user.displayName,
        "avatar": user.photoUrl,
        "googleAccountId": user.id
      };
      Object object = jsonEncode(information);
      print(object);
      http.Response postApi =
          await NetworkApiService().postApi("/user/login-google", object);

      LoginResponse customResponse =
          LoginResponse.fromJson(jsonDecode(postApi.body));
      if (postApi.statusCode == 200) {
        UserStore.to.saveProfile(customResponse);
        UserStore.to.setToken(customResponse.access_token ?? "");
        Get.offAndToNamed(AppRoutes.HOME);
      }
    } catch (e) {
      Get.snackbar(
        "Error",
        e.toString(),
        icon: const Icon(Icons.person, color: Colors.white),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
