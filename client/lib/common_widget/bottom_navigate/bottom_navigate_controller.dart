import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../view/home/home_controller.dart';

class BottomNavigateController extends GetxController {
  late final PageController pageController;
  var page = 0.obs;

  void handlePageChanged(int index) {
    page.value = index;
    switch(index){
      case 0:
        Get.find<HomeController>().getAllTopic();
    }
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