import 'package:client/common/app_color.dart';
import 'package:client/common_widget/my_button.dart';
import 'package:client/common_widget/text_field.dart';
import 'package:client/view/forgot_password/forgot_password_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../res/routes/names.dart';

class EnterOtpPage extends GetView<ForgotPasswordController> {
  const EnterOtpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/bg_login.png'),
                fit: BoxFit.cover)),
        child: Scaffold(
            appBar: AppBar(
              leading: IconButton(
                onPressed: () {
                  print("back");
                  Get.back();
                },
                icon: const Icon(Icons.arrow_back_ios),
              ),
            ),
            backgroundColor: Colors.transparent,
            body: SingleChildScrollView(
              child: Container(
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    const Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        'Enter Otp',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w600,
                            color: AppColors.primaryColor),
                      ),
                    ),
                    const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 55.0, vertical: 6),
                      child: Text(
                        'Enter otp send to your email!',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.normal),
                      ),
                    ),
                    Form(
                      key: controller.formField1,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 30),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            MyTextField(
                              hintText: 'Otp',
                              controller: controller.otpController,
                              checkLength: 4,
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 10),
                        child: MyButton(
                          text: 'Continue',
                          onTap: () {
                            if (controller.formField1.currentState!.validate()) {
                              controller.checkOtp();
                            }
                          },
                        )),
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
