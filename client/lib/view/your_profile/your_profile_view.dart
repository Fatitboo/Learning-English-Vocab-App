import 'dart:io';

import 'package:client/common/app_color.dart';
import 'package:client/common_widget/textfield_custom_profile.dart';
import 'package:client/common_widget/textfield_date_picker.dart';
import 'package:client/view/your_profile/your_profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common_widget/my_button.dart';

class YourProfileView extends StatelessWidget {
  YourProfileView({super.key});

  final controller = Get.put(YourProfileController());
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<YourProfileController>(builder: (_) {
      return Form(
        key: _formKey,
        child: Scaffold(
            backgroundColor: AppColors.rsBackground,
            appBar: _appBar(),
            resizeToAvoidBottomInset: true,
            body: SingleChildScrollView(
              child: Container(
                color: AppColors.rsBackground,
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    InformationUser(),
                    Container(
                      margin:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      child: Column(
                        children: [
                          TextFieldCustomProfile(
                            title: "Name: ",
                            textController: controller.nameController,
                            keyboardType: TextInputType.text,
                            obscureText: false,
                            initialValue: controller.nameController.text,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your name';
                              }
                              else if (value == 'Chưa cập nhật') {
                                return 'Please update your name';
                              } else {
                                return null;
                              }
                            },
                          ),
                          TextFieldCustomProfile(
                            title: "Email: ",
                            textController: controller.emailController,
                            keyboardType: TextInputType.emailAddress,
                            obscureText: false,
                            initialValue: controller.emailController.text,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your email';
                              }
                              else if (value == 'Chưa cập nhật') {
                                return 'Please update your name';
                              }
                              else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                                  .hasMatch(value)) {
                                return 'Please enter a valid email address';
                              } else {
                                return null;
                              }
                            },
                          ),
                          TextFieldCustomProfile(
                            title: "Phone number: ",
                            textController: controller.phoneController,
                            keyboardType: TextInputType.phone,
                            obscureText: false,
                            initialValue: controller.phoneController.text,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your phone number';
                              }
                              if (!RegExp(
                                      r'^((\+84|0)[2|3|4|5|6|7|8|9][0-9]{8,9})$')
                                  .hasMatch(value)) {
                                return 'Please enter a valid Vietnamese phone number';
                              }
                              return null;
                            },
                          ),
                          DatePickerCustomeProfile(
                              controller: controller.dateController),
                        ],
                      ),
                    ),
                    ButtonUpdateAcount(context),
                  ],
                ),
              ),
            )),
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
        "Your Profile",
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
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

  Widget InformationUser() => Center(
          child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        child: Column(
          children: [
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                Container(
                  width: 84,
                  // Kích thước của hình ảnh avatar (bán kính 50 + độ dày của viền 2)
                  height: 84,
                  // Kích thước của hình ảnh avatar (bán kính 50 + độ dày của viền 2)
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    // Đặt hình dạng của container thành hình tròn
                    border: Border.all(
                      color: Colors.grey, // Màu của viền
                      width: 2, // Độ dày của viền
                    ),
                  ),
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: controller.avatarPath.isEmpty
                        ? const AssetImage('assets/images/img.png')
                            as ImageProvider
                        : FileImage(File(controller.avatarPath)),
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
                        width: 1,
                      ),
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.add_photo_alternate_outlined),
                      color: Colors.white,
                      iconSize: 20,
                      onPressed: () {
                        controller.pickImage();
                      },
                    ),
                  ),
                )
              ],
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: Text(
                controller.nameController.text.isEmpty ?  "Chưa cập nhật" : controller.nameController.text,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w400),
              ),
            )
          ],
        ),
      ));

  Widget ButtonUpdateAcount(context) => Container(
      margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
      child: MyButton(
        text: 'Update Profile',
        onTap: () {
          if (_formKey.currentState!.validate()) {
            // If the form is valid, display a snackbar or perform some action
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Processing Data')),
            );
            controller.updateProfile();
          }
        },
      ));
}
