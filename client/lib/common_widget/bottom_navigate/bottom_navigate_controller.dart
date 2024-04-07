import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavigateController extends GetxController {
  late final PageController pageController;
  var page = 0.obs;

  void handlePageChanged(int index) {
    page.value = index;
  }
  void handleNavBarTap(int index) {
    pageController.jumpToPage(index);
  }



  @override
  void onInit() {
    pageController = PageController(initialPage: page.value, keepPage: false);
    super.onInit();
  }
}