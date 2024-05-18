import 'package:client/view/password_management/password_management_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/app_color.dart';
import '../../common_widget/my_button.dart';


class PasswordManagementView extends StatelessWidget {
  final controller = Get.put(PasswordManagementController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PasswordManagementController>(builder: (_) {
      return Scaffold(
        backgroundColor: AppColors.rsBackground,
        appBar: _appBar(),
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 20),
                  CurrentPasssView(),
                  SizedBox(height: 30),
                  NewPasssView(),
                  SizedBox(height: 20),
                  ConfirmNewPasssView(),
                  SizedBox(height: 20),
                  ButtonChangePass(),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
  AppBar _appBar() {
    return AppBar(
      elevation: 0,
      // Loại bỏ đường viền bóng của AppBar
      backgroundColor: AppColors.rsBackground,
      centerTitle: true,
      title: const Text(
        "Change Password",
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
    );
  }
  Widget ButtonChangePass() => Container(
      margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
      child: MyButton(text: 'Change password', onTap: () {  },)
  );


  Widget CurrentPasssView() => Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        "Current Password", // Sử dụng tiêu đề được truyền vào từ widget
        style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w500),
      ),
      SizedBox(height: 10.0),
      TextFormField(
        onChanged: (value) {
          controller.setCurrentPassword(value);
        },
        initialValue: controller.currentPass,
        obscureText: controller.obscurePassword,
        decoration: InputDecoration(
          suffixIcon: IconButton(
            icon: Icon(
              controller.obscurePassword ? Icons.visibility_outlined : Icons.visibility_off_outlined,
              color: AppColors.primaryColor,
            ),
            onPressed: () {
              controller.toggleObscurePassword();
            },
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 10),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.primaryColor), // Màu xanh khi focus
          ),
        ),
        cursorColor: AppColors.primaryColor,
      ),
    ],
  );
  Widget NewPasssView() => Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        "New Password", // Sử dụng tiêu đề được truyền vào từ widget
        style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w500),
      ),
      SizedBox(height: 10.0),
      TextFormField(
        onChanged: (value) {
          controller.setNewPassword(value);
        },
        initialValue: controller.newPass,
        obscureText: controller.obscureNewPassword,
        decoration: InputDecoration(
          suffixIcon: IconButton(
            icon: Icon(
              controller.obscureNewPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined,
              color: AppColors.primaryColor,
            ),
            onPressed: () {
              controller.toggleObscureNewPassword();
            },
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 10),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.primaryColor), // Màu xanh khi focus
          ),
        ),
        cursorColor: AppColors.primaryColor,
      ),
    ],
  );
  Widget ConfirmNewPasssView() => Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        "Confirm New Password", // Sử dụng tiêu đề được truyền vào từ widget
        style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w500),
      ),
      SizedBox(height: 10.0),
      TextFormField(
        onChanged: (value) {
          controller.setConfirmNewPassword(value);
        },
        initialValue: controller.confirmNewPass,
        obscureText: controller.obscureConfirmNewPassword,
        decoration: InputDecoration(
          suffixIcon: IconButton(
            icon: Icon(
              controller.obscureConfirmNewPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined,
              color: AppColors.primaryColor,
            ),
            onPressed: () {
              controller.toggleObscureConfirmNewPassword();
            },
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 10),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.primaryColor), // Màu xanh khi focus
          ),
        ),
        cursorColor: AppColors.primaryColor,
      ),
    ],
  );
}