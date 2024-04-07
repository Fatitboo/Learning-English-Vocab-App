import 'package:client/view/forgot_password_view.dart';
import 'package:client/view/home/home_binding.dart';
import 'package:client/view/home/home_page.dart';
import 'package:client/view/detail_topic/detail_topic_page.dart';
import 'package:client/view/flashcard/flashcard_binding.dart';
import 'package:client/view/flashcard/flashcard_page.dart';
import 'package:client/view/login/login_binding.dart';
import 'package:client/view/result_round_page.dart';
import 'package:client/view/result_test_page.dart';
import 'package:client/view/setting_test_page.dart';
import 'package:client/view/signup/sign_up_view.dart';
import 'package:client/view/signup/signup_binding.dart';
import 'package:client/view/welcome_view.dart';
import 'package:get/get.dart';
import 'package:client/view/login/login_view.dart';

import '../../view/detail_topic/detail_topic_binding.dart';
import '../../view/password_management/password_management_binding.dart';
import '../../view/password_management/password_management_view.dart';
import '../../view/privacy_policy/privacy_policy_binding.dart';
import '../../view/privacy_policy/privacy_policy_view.dart';
import '../../view/private_info_management/private_info_management_binding.dart';
import '../../view/private_info_management/private_info_management_view.dart';
import '../../view/statiscal/statiscal_binding.dart';
import '../../view/statiscal/statiscal_view.dart';
import '../../view/your_profile/your_profile_binding.dart';
import '../../view/your_profile/your_profile_view.dart';
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
      name: AppRoutes.NAV_BAR,
      page: () => NavBar(),
      binding: BottomNavigateBinding(),
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
    GetPage(
      name: AppRoutes.PRIVATE_INFO_MANAGER,
      page: () => PrivateInfoManagementView(),
      binding: PrivateInfoManagementBinding(),
      transition: Transition.native,
      fullscreenDialog: true,
      popGesture: false,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      name: AppRoutes.YOUR_PROFILE,
      page: () => YourProfileView(),
      binding: YourProfileBinding(),
      transition: Transition.native,
      fullscreenDialog: true,
      popGesture: false,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      name: AppRoutes.PRIVACY_POLICY,
      page: () => PrivacyPolicyView(),
      binding: PrivacyPolicyBinding(),
      transition: Transition.native,
      fullscreenDialog: true,
      popGesture: false,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      name: AppRoutes.PASSWORD_MANAGEMENT,
      page: () => PasswordManagementView(),
      binding: PasswordManagementBinding(),
      transition: Transition.native,
      fullscreenDialog: true,
      popGesture: false,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      name: AppRoutes.STATISCAL,
      page: () => StatiscalView(),
      binding: StatiscalBinding(),
      transition: Transition.native,
      fullscreenDialog: true,
      popGesture: false,
      transitionDuration: const Duration(milliseconds: 500),
    ),

    GetPage(
        name: AppRoutes.LEARNING_VOCABULARY,
        page: () => LearningVocabularyView(),
        binding: LearningVocabularyBinding(),
        transition: Transition.native,
        fullscreenDialog: true,
        popGesture: false,
        transitionDuration: const Duration(milliseconds: 500),

    ),

    GetPage(
      name: AppRoutes.DETAIL_LEARNED_TOPIC_WORD,
      page: () => DetailLearnedTopic(),
      binding: DetailLearnBinding(),
      transition: Transition.native,
      fullscreenDialog: true,
      popGesture: false,
      transitionDuration: const Duration(milliseconds: 500),

    ),
    GetPage(
      name: AppRoutes.SAVE_TOPIC,
      page: () => SavedTopicPage(),
      binding: SavedTopicBinding(),
      transition: Transition.native,
      fullscreenDialog: true,
      popGesture: false,
      transitionDuration: const Duration(milliseconds: 500),
    ),
  ];
}
