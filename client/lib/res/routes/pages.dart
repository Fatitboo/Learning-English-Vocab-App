import 'package:client/view/exam/exam_binding.dart';
import 'package:client/view/exam/exam_round_view.dart';
import 'package:client/view/exam/exam_view.dart';
import 'package:client/view/flashcard/result_flashcard.dart';
import 'package:client/view/forgot_password/enter_otp.dart';
import 'package:client/view/forgot_password/forgot_password_binding.dart';
import 'package:client/view/forgot_password/forgot_password_view.dart';
import 'package:client/view/forgot_password/reset_password.dart';
import 'package:client/view/home/home_binding.dart';
import 'package:client/view/home/home_page.dart';
import 'package:client/view/detail_topic/detail_topic_page.dart';
import 'package:client/view/flashcard/flashcard_binding.dart';
import 'package:client/view/flashcard/flashcard_page.dart';
import 'package:client/view/learning_vocabulary/round_learn/congratulation_round_view.dart';
import 'package:client/view/learning_vocabulary/round_learn/round_learn_binding.dart';
import 'package:client/view/learning_vocabulary/round_learn/round_learn_view.dart';
import 'package:client/view/login/login_binding.dart';
import 'package:client/view/result_round_page.dart';
import 'package:client/view/result_test_page.dart';
import 'package:client/view/saved_topic/saved_topic_binding.dart';
import 'package:client/view/saved_topic/saved_topic_page.dart';
import 'package:client/view/setting_test_page.dart';
import 'package:client/view/signup/sign_up_view.dart';
import 'package:client/view/signup/signup_binding.dart';
import 'package:client/view/welcome_view.dart';
import 'package:get/get.dart';
import 'package:client/view/login/login_view.dart';

import '../../view/detail_topic/detail_topic_binding.dart';
import '../../view/learning_vocabulary/detail_learned_topic/detail_learned_binding.dart';
import '../../view/learning_vocabulary/detail_learned_topic/detail_learned_topic.dart';
import '../../view/learning_vocabulary/learning_vocabulary_binding.dart';
import '../../view/learning_vocabulary/learning_vocabulary_view.dart';
import '../../view/password_management/password_management_view.dart';
import '../../view/privacy_policy/privacy_policy_binding.dart';
import '../../view/privacy_policy/privacy_policy_view.dart';
import '../../view/private_info_management/private_info_management_view.dart';
import '../../view/statiscal/statiscal_view.dart';
import '../../view/your_profile/your_profile_view.dart';
import '../middleware/route_welcome_middleware.dart';
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
        middlewares: [RouteWelcomeMiddleware(priority: 1)]),
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
      page: () => LoginView(),
      binding: LoginBinding(),
      transition: Transition.native,
      fullscreenDialog: true,
      popGesture: false,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      name: AppRoutes.FORGOT_PASSWORD,
      page: () => ForgotPasswordView(),
      binding: ForgotPasswordBinding(),
      transition: Transition.native,
      fullscreenDialog: true,
      popGesture: false,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      name: AppRoutes.ENTER_OTP,
      page: () => EnterOtpPage(),
      binding: ForgotPasswordBinding(),
    ),
    GetPage(
      name: AppRoutes.RESET_PASS,
      page: () => ResetPasswordPage(),
      binding: ForgotPasswordBinding(),
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
      transition: Transition.native,
      fullscreenDialog: true,
      popGesture: false,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      name: AppRoutes.YOUR_PROFILE,
      page: () => YourProfileView(),
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
      transition: Transition.native,
      fullscreenDialog: true,
      popGesture: false,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      name: AppRoutes.STATISCAL,
      page: () => StatiscalView(),
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
      binding: DetailLearnedBinding(),
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
    GetPage(
      name: AppRoutes.ROUND_LEARN,
      page: () => RoundLearnView(),
      binding: RoundLearnBinding(),
      transition: Transition.native,
      fullscreenDialog: true,
      popGesture: false,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      name: AppRoutes.CONGRATULATION_ROUND,
      page: () => CongratulationView(),
      transition: Transition.native,
      fullscreenDialog: true,
      popGesture: false,
      transitionDuration: const Duration(milliseconds: 500),
    ),

    GetPage(
      name: AppRoutes.EXAM,
      page: () => ExamView(),
      binding: ExamBinding(),
      transition: Transition.native,
      fullscreenDialog: true,
      popGesture: false,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      name: AppRoutes.EXAM_ROUND,
      page: () => ExamRoundView(),
      transition: Transition.native,
      fullscreenDialog: true,
      popGesture: false,
      transitionDuration: const Duration(milliseconds: 500),
    ),

    GetPage(
      name: AppRoutes.FLASH_CARD_RESULT,
      page: () => ResultFlashCard(),
      transition: Transition.native,
      fullscreenDialog: true,
      popGesture: false,
      transitionDuration: const Duration(milliseconds: 500),
    ),
  ];
}
