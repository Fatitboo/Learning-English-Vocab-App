import 'package:client/view/detail_topic/detail_topic_binding.dart';
import 'package:client/view/detail_topic/detail_topic_page.dart';
import 'package:client/view/flashcard/flashcard_binding.dart';
import 'package:client/view/flashcard/flashcard_page.dart';
import 'package:client/view/home/home_binding.dart';
import 'package:client/view/home/home_page.dart';
import 'package:client/view/login/login_binding.dart';
import 'package:client/view/login/login_controller.dart';
import 'package:client/view/signup/sign_up_view.dart';
import 'package:client/view/signup/signup_binding.dart';
import 'package:client/view/signup/signup_controller.dart';
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
      page: () => LoginView(),
      binding: LoginBinding(),
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
      name: AppRoutes.HOME,
      page: () => HomePage(),
      binding: HomeBinding(),
      transition: Transition.native,
      fullscreenDialog: true,
      popGesture: false,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      name: AppRoutes.DETAIL_TOPIC,
      page: () => DetailTopicPage(),
      binding: DetailTopicBinding(),
      transition: Transition.native,
      fullscreenDialog: true,
      popGesture: false,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      name: AppRoutes.FLASH_CARD,
      page: () => FlashCardPage(),
      binding: FlashCardBinding(),
      transition: Transition.native,
      fullscreenDialog: true,
      popGesture: false,
      transitionDuration: const Duration(milliseconds: 500),
    ),
  ];
}
