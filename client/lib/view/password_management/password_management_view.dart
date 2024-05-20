import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:client/view/password_management/password_management_controller.dart';
import '../../common/app_color.dart';
import '../../common_widget/my_button.dart';

class PasswordManagementView extends StatelessWidget {
  final controller = Get.put(PasswordManagementController());
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PasswordManagementController>(builder: (_) {
      return Form(
        key: _formKey,
        child: Scaffold(
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
                    SizedBox(height: 30),
                    NewPasssView(),
                    SizedBox(height: 20),
                    ConfirmNewPasssView(),
                    SizedBox(height: 20),
                    ButtonChangePass(context),
                  ],
                ),
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

  Widget ButtonChangePass(context) => Container(
    margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
    child: MyButton(
      text: 'Change password',
      onTap: () {
        if (_formKey.currentState!.validate()) {
          // If the form is valid, display a snackbar or perform some action
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Processing Data')),
          );
          controller.changePassword();
        }
      },
    ),
  );

  InputDecoration _inputDecoration({required bool obscure, required VoidCallback onTap}) {
    return InputDecoration(
      suffixIcon: IconButton(
        icon: Icon(
          obscure ? Icons.visibility_outlined : Icons.visibility_off_outlined,
          color: Colors.grey,
        ),
        onPressed: onTap,
      ),
      contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 10),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.primaryColor), // Màu xanh khi focus
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.red),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.red),
      ),
    );
  }

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
        controller: controller.newPass,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter your password';
          }
          else if (value.length < 8) {
            return 'Password must be at least 8 characters long';
          }
          else {
            return null;
          }
        },
        obscureText: controller.obscureNewPassword,
        decoration: _inputDecoration(
          obscure: controller.obscureNewPassword,
          onTap: () {
            controller.toggleObscureNewPassword();
          },
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
        controller: controller.confirmNewPass,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter your password';
          }
          else if (value.length < 8) {
            return 'Password must be at least 8 characters long';
          }
          else if (value != controller.newPass.text) {
            return 'Password incorrect! Please enter again';
          }
          else {
            return null;
          }
        },
        obscureText: controller.obscureConfirmNewPassword,
        decoration: _inputDecoration(
          obscure: controller.obscureConfirmNewPassword,
          onTap: () {
            controller.toggleObscureConfirmNewPassword();
          },
        ),
        cursorColor: AppColors.primaryColor,
      ),
    ],
  );
}
