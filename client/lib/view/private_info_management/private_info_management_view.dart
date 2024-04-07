
import 'package:client/common/app_color.dart';
import 'package:client/common_widget/my_button.dart';
import 'package:client/res/routes/names.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PrivateInfoManagementView extends GetView<PrimaryScrollController> {
  PrivateInfoManagementView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0, // Loại bỏ đường viền bóng của AppBar
        backgroundColor: AppColors.rsBackground,
        centerTitle: true,
        title: const Text(
          "Profile",
          style: TextStyle(
              color: Colors.black,

              fontWeight: FontWeight.w500
          ),
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
                  ItemLogOut(),
                ],
              ),
            ),
            ButtonDeleteAcount(),
          ],
        ),
      ),
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
                Container(
                  width: 104, // Kích thước của hình ảnh avatar (bán kính 50 + độ dày của viền 2)
                  height: 104, // Kích thước của hình ảnh avatar (bán kính 50 + độ dày của viền 2)
                  decoration: BoxDecoration(
                    shape: BoxShape.circle, // Đặt hình dạng của container thành hình tròn
                    border: Border.all(
                      color: Colors.grey, // Màu của viền
                      width: 2, // Độ dày của viền
                    ),
                  ),
                  child: const CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('assets/images/img.png'),
                    backgroundColor: Colors.transparent,
                  ),
                ),
                // Button edit
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.white,
                        width: 0.5,
                      ),
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.add_photo_alternate_outlined),
                      color: Colors.white,
                      iconSize: 20,
                      onPressed: () {},
                    ),
                  ),
                )
              ],
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: Text(
                "Phan Trọng Tính",
                style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w400),
              ),
            )
          ],
        ),
      )
  );

  Widget ButtonDeleteAcount() => Container(
      margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
      child: MyButton(text: 'Delete Account', onTap: () {  },)
  );

  Widget ItemYourProfile() => GestureDetector(
    onTap: () {},
    child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(Icons.account_circle_outlined, color: AppColors.primaryColor, size: 30),
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
                  icon: const Icon(Icons.arrow_forward_ios_outlined, color: AppColors.primaryColor, size: 22),
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
      // Get.toNamed(AppRoutes.SAVE_TOPIC);
    },
    child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(Icons.bookmark_border_outlined, color: AppColors.primaryColor, size: 30),
                const Text(
                  "Save topic",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Get.toNamed(AppRoutes.SAVE_TOPIC);
                  },
                  icon: const Icon(Icons.arrow_forward_ios_outlined, color: AppColors.primaryColor, size: 22),
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
  Widget ItemPrivacyPolicy() => GestureDetector(
    onTap: () {},
    child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(Icons.help_outline_outlined, color: AppColors.primaryColor, size: 30),
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
                  icon: const Icon(Icons.arrow_forward_ios_outlined, color: AppColors.primaryColor, size: 22),
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
  Widget ItemPasswordManagement() => GestureDetector(
    onTap: () {},
    child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(Icons.key, color: AppColors.primaryColor, size: 30),
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
                  icon: const Icon(Icons.arrow_forward_ios_outlined, color: AppColors.primaryColor, size: 22),
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
  Widget ItemLogOut() => GestureDetector(
    onTap: () {},
    child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(Icons.login_outlined, color: AppColors.primaryColor, size: 30),
                const Text(
                  "Log out",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.arrow_forward_ios_outlined, color: AppColors.primaryColor, size: 22),
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
}


