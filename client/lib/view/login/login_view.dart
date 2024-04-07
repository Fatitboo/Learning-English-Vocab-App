import 'package:client/common/app_color.dart';
import 'package:client/common_widget/my_button.dart';
import 'package:client/view/login/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../common_widget/text_field.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/bg_login.png'),
                fit: BoxFit.cover)),
        child: Scaffold(
            backgroundColor: Colors.transparent,
            body: SingleChildScrollView(
              child: Container(
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                child: Form(
                  key: controller.formField,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 50,
                      ),

                      const Padding(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          'Login here',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w600,
                              color: Color(0xff1f41bb)),
                        ),
                      ),

                      const Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 75.0, vertical: 10),
                        child: Text(
                          'Welcome back you\'ve been missed!',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.normal),
                        ),
                      ),

                      // text field email
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 30),
                        child: SizedBox(
                          height: 430,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              MyTextField(
                                hintText: 'Email',
                                prefixIcon: Icon(Icons.email),
                                controller: controller.emailController,
                                checkEmail: true,
                              ),
                              MyTextField(
                                hintText: 'Password',
                                prefixIcon: Icon(Icons.lock),
                                isPass: true,
                                controller: controller.passwordController,
                                checkLength: 8,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 15),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        controller.toPageForgotPass();
                                      },
                                      child: const Text(
                                        'Forgot your password?',
                                        textAlign: TextAlign.end,
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                            color: AppColors.primaryColor),
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              // btn login
                              Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10),
                                  child: MyButton(
                                    text: "Sign In",
                                    onTap: () {
                                      if (controller.formField.currentState!
                                          .validate()) {
                                        controller.emailController.clear();
                                        controller.passwordController.clear();
                                        controller.signUserIn();
                                      }
                                    },
                                  )),

                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 35, ),
                                child: InkWell(
                                  onTap: () {
                                    controller.toPageSignUp();
                                  },
                                  child: const Text(
                                    'Create new account',
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
                      ),



                      // forgot password


                      const SizedBox(
                        height: 20,
                      ),

                      const Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                        child: Text(
                          'Or continue with',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: AppColors.primaryColor),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30.0),
                        child: SizedBox(
                          height: 50,
                          width: double.infinity,
                          child: OutlinedButton.icon(
                              onPressed: () {},
                              icon: Image.asset("assets/icons/google.png"),
                              label: const Text(
                                'Sign In with Google',
                                style: TextStyle(color: Color(0xff2186ab)),
                              ),
                              style: ButtonStyle(
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                side: const BorderSide(color: Colors.purple),
                                borderRadius: BorderRadius.circular(10.0),
                              )))),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )),
      ),
    );
  }
}
