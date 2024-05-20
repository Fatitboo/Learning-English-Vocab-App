import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../../res/routes/names.dart';
import '../../res/data/network_api_service.dart';
import '../../res/model/login_response.dart';
import '../../res/storage/user_storage.dart';

final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ["email"]);

class LoginController extends GetxController {
  GoogleSignInAccount? _currentUser;
  final formField = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
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
      print(e.toString());
      Get.snackbar(
        "Error",
        e.toString(),
        icon: const Icon(Icons.person, color: Colors.white),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  Future<void> signUserIn() async {
    try {
      var information = {
        'username': emailController.text.trim(),
        'password': passwordController.text.trim(),
      };
      Object object = jsonEncode(information);
      print(object);
      http.Response postApi =
          await NetworkApiService().postApi("/user/login", object);

      if (postApi.statusCode == 200) {
        LoginResponse customResponse =
            LoginResponse.fromJson(jsonDecode(postApi.body));
        UserStore.to.saveProfile(customResponse);
        UserStore.to.setToken(customResponse.access_token ?? "");
        Get.snackbar(
          "Login successfully",
          "",
          icon: const Icon(Icons.person, color: Colors.white),
          snackPosition: SnackPosition.BOTTOM,
        );
        Get.offAndToNamed(AppRoutes.NAV_BAR);
      } else{
        Get.snackbar(
          "Bad Request",
          jsonDecode(postApi.body).message,
          icon: const Icon(Icons.person, color: Colors.white),
          snackPosition: SnackPosition.BOTTOM,
        );
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

  toPageSignUp() async {
    Get.offAndToNamed(AppRoutes.SIGN_UP);
  }

  toPageForgotPass() async {
    Get.toNamed(AppRoutes.FORGOT_PASSWORD);
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
