import 'package:client/common/app_color.dart';
import 'package:client/common_widget/my_button.dart';
import 'package:client/common_widget/text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../res/routes/names.dart';

class ForgotPasswordView extends StatefulWidget {
  const ForgotPasswordView({super.key});

  @override
  State<ForgotPasswordView> createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends State<ForgotPasswordView> {
  final formField = GlobalKey<FormState>();
  final emailController = TextEditingController();
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
            leading: IconButton(onPressed: () {
              print("back");
              Get.back();
              }, icon: const Icon(Icons.arrow_back_ios),

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
                        'Forgot Password',
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
                        'Recover your forgotten password!',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.normal),
                      ),
                    ),
                     Form(
                       key: formField,
                       child: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 20, horizontal: 30),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            MyTextField(hintText: 'Email', checkEmail: true, controller: emailController, )
                          ],
                        ),
                                           ),
                     ),

                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 10),
                      child: MyButton(text: 'Send', onTap: (){
                        if (formField.currentState!.validate()) {

                        }
                      },)
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 30, horizontal: 30),
                      child: InkWell(
                        onTap: () {
                          Get.offAndToNamed(AppRoutes.SIGN_IN);
                        },
                        child: const Text(
                          'Already have an account',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: Colors.black),
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            )),
      ),
    );
  }
}
