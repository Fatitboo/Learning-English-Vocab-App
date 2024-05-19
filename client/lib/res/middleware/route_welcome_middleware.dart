import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../routes/names.dart';
import '../storage/user_storage.dart';

class RouteWelcomeMiddleware extends GetMiddleware {
  @override
  int? priority = 0;

  RouteWelcomeMiddleware({required this.priority});

  @override
  RouteSettings? redirect(String? route) {
    if (UserStore.to.isLogin == true) {
      return RouteSettings(name: AppRoutes.HOME);
    } else {
      return RouteSettings(name: AppRoutes.SIGN_IN);
    }
  }
}
