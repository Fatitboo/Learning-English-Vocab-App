import 'package:client/view/exam/exam_view.dart';
import 'package:client/view/flashcard/flashcard_page.dart';
import 'package:client/view/learning_vocabulary/learning_vocabulary_view.dart';
import 'package:client/view/login/login_view.dart';
import 'package:client/view/private_info_management/private_info_management_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/app_color.dart';
import '../../view/home/home_page.dart';
import '../../view/statiscal/statiscal_view.dart';
import '../../view/your_profile/your_profile_view.dart';
import 'bottom_navigate_controller.dart';

class NavBar extends GetView<BottomNavigateController> {
  const NavBar({super.key});
  Widget _buildPageView() {
    return PageView(
      reverse: false,
      controller: controller.pageController,
      onPageChanged: (index) => {controller.handlePageChanged(index)},
      physics: const NeverScrollableScrollPhysics(),
      children: [
        HomePage(),
        LearningVocabularyView(),
        ExamView(),
        StatiscalView(),
        PrivateInfoManagementView(),
      ],
    );
  }

  Widget _buildBottomNavigation(BuildContext context) {
    Get.put(BottomNavigateController());
    return Obx(() => BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.school),
          label: 'Study',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.insert_page_break_sharp),
          label: 'Examine',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.pie_chart),
          label: 'Statistic',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
      ],
      currentIndex: controller.page.value,
      type: BottomNavigationBarType.fixed,
      onTap: (value) => {controller.handleNavBarTap(value)},
      selectedItemColor: AppColors.primaryColor,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildPageView(),
      bottomNavigationBar: _buildBottomNavigation(context),
    );
  }
}
