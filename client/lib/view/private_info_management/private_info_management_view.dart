import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:client/common/app_color.dart';
import 'package:client/common_widget/my_button.dart';
import 'package:client/res/routes/names.dart';
import 'package:client/view/private_info_management/private_info_management_controller.dart';

class PrivateInfoManagementView extends StatelessWidget {
  PrivateInfoManagementView({super.key});
  final controller = Get.put(PrivateInfoManagementController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<PrivateInfoManagementController>(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: AppColors.rsBackground,
            centerTitle: true,
            title: const Text(
              "Profile",
              style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
            ),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              color: Colors.black,
              onPressed: () {
                Get.back();
              },
            ),
          ),
          body: Container(
            color: AppColors.rsBackground,
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                InformationUser(),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: Column(
                    children: [
                      ItemYourProfile(),
                      ItemSaveTopic(),
                      ItemPrivacyPolicy(),
                      ItemPasswordManagement(),
                    ],
                  ),
                ),
                ButtonLogoutAcount(),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget InformationUser() => Center(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(80),
                  child: Image.network(
                    '${controller.avatarPath}',
                    height: 100.0,
                    width: 100.0,
                  ),
                )
              ],
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: Text(
                controller.fullName,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w400),
              ),
            )
          ],
        ),
      ));

  Widget ButtonLogoutAcount() => Container(
      margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
      child: MyButton(
        text: 'Log out',
        onTap: () {
          controller.logOut();
        },
      ));

  Widget ItemYourProfile() => GestureDetector(
    onTap: () {
      Get.toNamed(AppRoutes.YOUR_PROFILE);
    },
    child: Container(
        margin: const EdgeInsets.only(left: 20, top: 10, right: 20, bottom: 0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(Icons.account_circle_outlined,
                    color: AppColors.primaryColor, size: 30),
                const Text(
                  "Your profile",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Get.toNamed(AppRoutes.YOUR_PROFILE);
                  },
                  icon: const Icon(Icons.arrow_forward_ios_outlined,
                      color: AppColors.primaryColor, size: 22),
                ),
              ],
            ),
            Container(
              height: 1.5,
              color: Colors.grey,
              margin: const EdgeInsets.only(top: 8),
            ),
          ],
        )
    ),
  );

  Widget ItemSaveTopic() => GestureDetector(
    onTap: () {
      Get.toNamed(AppRoutes.SAVE_TOPIC);
    },
    child: Container(
        margin: const EdgeInsets.only(left: 20, top: 10, right: 20, bottom: 0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(Icons.bookmark_border_outlined,
                    color: AppColors.primaryColor, size: 30),
                const Text(
                  "Save topic",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.arrow_forward_ios_outlined,
                      color: AppColors.primaryColor, size: 22),
                ),
              ],
            ),
            Container(
              height: 1.5,
              color: Colors.grey,
              margin: const EdgeInsets.only(top: 8),
            ),
          ],
        )),
  );

  Widget ItemPrivacyPolicy() => GestureDetector(
    onTap: () {
      Get.toNamed(AppRoutes.PRIVACY_POLICY);
    },
    child: Container(
        margin: const EdgeInsets.only(left: 20, top: 10, right: 20, bottom: 0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(Icons.help_outline_outlined,
                    color: AppColors.primaryColor, size: 30),
                const Text(
                  "Privacy policy",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Get.toNamed(AppRoutes.PRIVACY_POLICY);
                  },
                  icon: const Icon(Icons.arrow_forward_ios_outlined,
                      color: AppColors.primaryColor, size: 22),
                ),
              ],
            ),
            Container(
              height: 1.5,
              color: Colors.grey,
              margin: const EdgeInsets.only(top: 8),
            ),
          ],
        )),
  );

  Widget ItemPasswordManagement() => GestureDetector(
    onTap: () {
      Get.toNamed(AppRoutes.PASSWORD_MANAGEMENT);
    },
    child: Container(
        margin: const EdgeInsets.only(left: 20, top: 10, right: 20, bottom: 0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(Icons.key,
                    color: AppColors.primaryColor, size: 30),
                const Text(
                  "Password Management",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Get.toNamed(AppRoutes.PASSWORD_MANAGEMENT);
                  },
                  icon: const Icon(Icons.arrow_forward_ios_outlined,
                      color: AppColors.primaryColor, size: 22),
                ),
              ],
            ),
            Container(
              height: 1.5,
              color: Colors.grey,
              margin: const EdgeInsets.only(top: 8),
            ),
          ],
        )),
  );
}
