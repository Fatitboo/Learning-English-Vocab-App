import 'package:flutter/material.dart';

import '../common/app_color.dart';

class PasswordManagementView extends StatefulWidget {
  @override
  _PasswordManagementViewState createState() => _PasswordManagementViewState();
}

class _PasswordManagementViewState extends State<PasswordManagementView> {
  bool _obscurePassword = true;
  String currentPass = "pass hiện tại";
  bool _obscureNewPassword = true;
  String newPass = "";
  bool _obscureConfirmNewPassword = true;
  String confirmNewPass = "";

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
  Widget CurrentPasssView() => Column(
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
          setState(() {
            currentPass = value;
          });
        },
        initialValue: currentPass,
        obscureText: _obscurePassword,
        decoration: InputDecoration(
          suffixIcon: IconButton(
            icon: Icon(
              _obscurePassword ? Icons.visibility_outlined : Icons.visibility_off_outlined,
              color: AppColors.primaryColor,
            ),
            onPressed: () {
              setState(() {
                _obscurePassword = !_obscurePassword;
              });
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
        style: TextStyle(fontSize: 14.0),
      ),
      SizedBox(height: 10.0),
      TextFormField(
        onChanged: (value) {
          setState(() {
            newPass = value;
          });
        },
        initialValue: newPass,
        obscureText: _obscureNewPassword,
        decoration: InputDecoration(
          suffixIcon: IconButton(
            icon: Icon(
              _obscureNewPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined,
              color: AppColors.primaryColor,
            ),
            onPressed: () {
              setState(() {
                _obscureNewPassword = !_obscureNewPassword;
              });
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
        style: TextStyle(fontSize: 14.0),
      ),
      SizedBox(height: 10.0),
      TextFormField(
        onChanged: (value) {
          setState(() {
            confirmNewPass = value;
          });
        },
        initialValue: confirmNewPass,
        obscureText: _obscureConfirmNewPassword,
        decoration: InputDecoration(
          suffixIcon: IconButton(
            icon: Icon(
              _obscureConfirmNewPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined,
              color: AppColors.primaryColor,
            ),
            onPressed: () {
              setState(() {
                _obscureConfirmNewPassword = !_obscureConfirmNewPassword;
              });
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