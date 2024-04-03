import 'package:client/view/password_management/password_management_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/app_color.dart';


class PasswordManagementView extends GetView<PasswordManagementController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 20),
                CurrentPasssView(),
                SizedBox(height: 40),
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
  }
  AppBar _appBar() {
    return AppBar(
      elevation: 0,
      // Loại bỏ đường viền bóng của AppBar
      backgroundColor: Colors.transparent,
      centerTitle: true,
      title: const Text(
        "Password Management",
        style: TextStyle(
            color: Colors.black,
            fontSize: 22,
            fontWeight: FontWeight.w500
        ),
      ),
      leading: IconButton(
        icon: Icon(Icons.arrow_back, size: 30),
        color: Colors.black,
        onPressed: () {},
      ),
    );
  }
  Widget ButtonChangePass() => Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      alignment: Alignment.center,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          primary: AppColors.primaryColor,
          minimumSize: Size(280, 60),
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          ),
        ),
        child: const Text(
          "Change Password",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w400,
          ),
        ),
      )
  );
  Widget CurrentPasssView() => Obx(() => Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        "Current Password", // Sử dụng tiêu đề được truyền vào từ widget
        style: TextStyle(fontSize: 14.0),
      ),
      SizedBox(height: 10.0),
      TextFormField(
        onChanged: (value) {
          controller.setCurrentPassword(value);
        },
        initialValue: controller.currentPass.value,
        obscureText: controller.obscurePassword.value,
        decoration: InputDecoration(
          suffixIcon: IconButton(
            icon: Icon(
              controller.obscurePassword.value ? Icons.visibility_outlined : Icons.visibility_off_outlined,
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
  )
  );
  Widget NewPasssView() => Obx(() => Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        "New Password", // Sử dụng tiêu đề được truyền vào từ widget
        style: TextStyle(fontSize: 14.0),
      ),
      SizedBox(height: 10.0),
      TextFormField(
        onChanged: (value) {
          controller.setNewPassword(value);
        },
        initialValue: controller.newPass.value,
        obscureText: controller.obscureNewPassword.value,
        decoration: InputDecoration(
          suffixIcon: IconButton(
            icon: Icon(
              controller.obscureNewPassword.value ? Icons.visibility_outlined : Icons.visibility_off_outlined,
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
  )
  );
  Widget ConfirmNewPasssView() => Obx(() => Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        "Confirm New Password", // Sử dụng tiêu đề được truyền vào từ widget
        style: TextStyle(fontSize: 14.0),
      ),
      SizedBox(height: 10.0),
      TextFormField(
        onChanged: (value) {
          controller.setConfirmNewPassword(value);
        },
        initialValue: controller.confirmNewPass.value,
        obscureText: controller.obscureConfirmNewPassword.value,
        decoration: InputDecoration(
          suffixIcon: IconButton(
            icon: Icon(
              controller.obscureConfirmNewPassword.value ? Icons.visibility_outlined : Icons.visibility_off_outlined,
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
  )
  );
}