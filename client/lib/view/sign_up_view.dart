import 'package:client/common/app_color.dart';
import 'package:client/common_widget/text_field.dart';
import 'package:flutter/material.dart';

import '../common_widget/my_button.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
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
                    const Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 10, horizontal: 30),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Email',
                            style: TextStyle(
                              fontSize: 15,
                            ),
                            textAlign: TextAlign.start,
                          ),
                          MyTextField(hintText: 'Email')
                        ],
                      ),
                    ),

                    // text field password
                    const Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 0, horizontal: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Password',
                            style: TextStyle(fontSize: 15),
                          ),
                          MyTextField(hintText: '*******')
                        ],
                      ),
                    ),

                    // text field confirm password
                    const Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 10, horizontal: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Confirm Password',
                            style: TextStyle(fontSize: 15),
                          ),
                          MyTextField(hintText: '*******')
                        ],
                      ),
                    ),

                    // btn sign up
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 10),
                      child: MyButton(text: 'Sign Up', onTap: (){},)
                    ),

                    // have an account
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 30, horizontal: 30),
                      child: InkWell(
                        onTap: () {},
                        child: const Text(
                          'Already have an account',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: Colors.black),
                        ),
                      ),
                    ),

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
