import 'package:client/view/home/home_binding.dart';
import 'package:client/view/home/home_page.dart';
import 'package:client/view/login/login_binding.dart';
import 'package:client/view/password_management/password_management_binding.dart';
import 'package:client/view/password_management/password_management_view.dart';
import 'package:client/view/privacy_policy/privacy_policy_binding.dart';
import 'package:client/view/privacy_policy/privacy_policy_view.dart';
import 'package:client/view/private_info_management/private_info_management_binding.dart';
import 'package:client/view/private_info_management/private_info_management_view.dart';
import 'package:client/view/signup/sign_up_view.dart';
import 'package:client/view/signup/signup_binding.dart';
import 'package:client/view/statiscal/statiscal_binding.dart';
import 'package:client/view/statiscal/statiscal_view.dart';
import 'package:client/view/your_profile/your_profile_binding.dart';
import 'package:client/view/your_profile/your_profile_view.dart';
import 'package:get/get.dart';
import 'package:client/view/login/login_view.dart';

import 'names.dart';

class AppPages {
  static const INITIAL = AppRoutes.STATISCAL;
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
  ];
}
