import 'package:client/view/forgot_password_view.dart';
import 'package:client/view/home/home_binding.dart';
import 'package:client/view/home/home_page.dart';
import 'package:client/view/login/login_binding.dart';
import 'package:client/view/result_round_page.dart';
import 'package:client/view/result_test_page.dart';
import 'package:client/view/setting_test_page.dart';
import 'package:client/view/signup/sign_up_view.dart';
import 'package:client/view/signup/signup_binding.dart';
import 'package:client/view/welcome_view.dart';
import 'package:get/get.dart';
import 'package:client/view/login/login_view.dart';

import 'names.dart';

class AppPages {
  static const INITIAL = AppRoutes.INITIAL;
  static List<String> history = [];
  static final List<GetPage> routes = [
    // user pages
    GetPage(
      name: AppRoutes.INITIAL,
      page: () => WelcomeView(),
      transition: Transition.native,
      fullscreenDialog: true,
      popGesture: false,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      name: AppRoutes.SIGN_UP,
      page: () => SignUpView(),
      binding: SignUpBinding(),
      transition: Transition.native,
      fullscreenDialog: true,
      popGesture: false,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      name: AppRoutes.SIGN_IN,
      page: () =>  LoginView(),
      binding: LoginBinding(),
      transition: Transition.native,
      fullscreenDialog: true,
      popGesture: false,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      name: AppRoutes.FORGOT_PASSWORD,
      page: () => ForgotPasswordView(),
      transition: Transition.native,
      fullscreenDialog: true,
      popGesture: false,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      name: AppRoutes.RESULT_ROUND,
      page: () => ResultRoundPage(),
      transition: Transition.native,
      fullscreenDialog: true,
      popGesture: false,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      name: AppRoutes.RESULT_TEST,
      page: () => ResultTestPage(),
      transition: Transition.native,
      fullscreenDialog: true,
      popGesture: false,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      name: AppRoutes.SETTING_TEST,
      page: () => SettingTestPage(),
      transition: Transition.native,
      fullscreenDialog: true,
      popGesture: false,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      name: AppRoutes.HOME,
      page: () => HomePage(),
      binding: HomeBinding(),
      transition: Transition.native,
      fullscreenDialog: true,
      popGesture: false,
      transitionDuration: const Duration(milliseconds: 500),
    ),
  ];
}
