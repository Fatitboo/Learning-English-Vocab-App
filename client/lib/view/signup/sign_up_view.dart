import 'package:client/common/app_color.dart';
import 'package:client/common_widget/text_field.dart';
import 'package:client/view/signup/signup_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common_widget/my_button.dart';

class SignUpView extends GetView<SignUpController> {
  const SignUpView({super.key});

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
                child: Column(
                  children: [
                    const SizedBox(
                      height: 50,
                    ),

                    const Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        'Create new account',
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
                        'Create an account so you can learn all the English topics!',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.normal),
                      ),
                    ),

                    // text field email
                      Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 30),
                      child: Form(
                        key: controller.formField,
                        child:  SizedBox(
                          height: 450,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              MyTextField(hintText: 'Email', controller: controller.emailController,checkEmail: true,prefixIcon:const Icon(Icons.email), ),
                              MyTextField(hintText: 'Password', controller: controller.passwordController,checkLength: 8, isPass: true,prefixIcon:const Icon(Icons.lock),),
                              MyTextField(hintText: 'Confirm password', controller: controller.confirmPassController, isPass: true,prefixIcon:const Icon(Icons.lock),),
                              Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 20),
                                  child: MyButton(text: 'Sign Up', onTap: (){
                                    if (controller.formField.currentState!
                                        .validate()) {
                                      controller.emailController.clear();
                                      controller.passwordController.clear();

                                    }
                                  },)
                              ),

                              // have an account
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10,),
                                child: InkWell(
                                  onTap: () {
                                    controller.toPageSignIn();
                                  },

                                  child: const Text(
                                    'Already have an account',
                                    style: TextStyle(

                                        fontSize: 15,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),


                    // btn sign up


                    // or continue with
                    const Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 10, horizontal: 30),
                      child: Text(
                        'Or continue with',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: AppColors.primaryColor),
                      ),
                    ),

                    // sign up with google
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30.0),
                      child: SizedBox(
                        height: 50,
                        width: double.infinity,
                        child: OutlinedButton.icon(
                            onPressed: () {},
                            icon: Image.asset("assets/icons/google.png"),
                            label: const Text(
                              'Sign Up with Google',
                              style: TextStyle(color: Color(0xff2186ab)),
                            ),
                            style: ButtonStyle(
                                shape:
                                MaterialStateProperty.all<RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      side: const BorderSide(color: Colors.purple),
                                      borderRadius: BorderRadius.circular(10.0),
                                    )))),
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
