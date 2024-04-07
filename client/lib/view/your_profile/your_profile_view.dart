
import 'package:client/common/app_color.dart';
import 'package:client/common_widget/textfield_custom_profile.dart';
import 'package:client/common_widget/textfield_date_picker.dart';
import 'package:client/view/your_profile/your_profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class YourProfileView extends GetView<YourProfileController> {

  YourProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _appBar(),
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                InformationUser(),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  child: Column(
                    children: [
                      TextFieldCustomProfile(title: "Name: "),
                      TextFieldCustomProfile(title: "Email: "),
                      TextFieldCustomProfile(title: "Phone number: "),
                      DatePickerCustomeProfile(),
                    ],
                  ),
                ),
                ButtonUpdateAcount(),
              ],
            ),
          ),
        )
    );
  }

  AppBar _appBar() {
    return AppBar(
      elevation: 0, // Loại bỏ đường viền bóng của AppBar
      backgroundColor: Colors.transparent,
      centerTitle: true,
      title: const Text(
        "Your Profile",
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

  Widget InformationUser() => Center(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        child: Column(
          children: [
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                Container(
                  width: 84, // Kích thước của hình ảnh avatar (bán kính 50 + độ dày của viền 2)
                  height: 84, // Kích thước của hình ảnh avatar (bán kính 50 + độ dày của viền 2)
                  decoration: BoxDecoration(
                    shape: BoxShape.circle, // Đặt hình dạng của container thành hình tròn
                    border: Border.all(
                      color: Colors.grey, // Màu của viền
                      width: 2, // Độ dày của viền
                    ),
                  ),
                  child: CircleAvatar(
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
                        width: 1,
                      ),
                    ),
                    child: IconButton(
                      icon: Icon(Icons.edit),
                      color: Colors.white,
                      iconSize: 18,
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
                style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w400),
              ),
            )
          ],
        ),
      )
  );

  Widget ButtonUpdateAcount() => Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryColor,
          minimumSize: Size(280, 60),
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          ),
        ),
        child: const Text(
          "Update Profile",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w400,
          ),
        ),
      )
  );
}


