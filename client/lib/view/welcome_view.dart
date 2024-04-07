import 'package:client/common/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../res/routes/names.dart';

class WelcomeView extends StatefulWidget {
  const WelcomeView({super.key});

  @override
  State<WelcomeView> createState() => _WelcomeViewState();
}

class _WelcomeViewState extends State<WelcomeView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/bg_login.png'),
              fit: BoxFit.cover)),
      child: SafeArea(
        child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 15, bottom: 20, left: 20, right: 20),
                    child: Image.asset('assets/images/img_welcome.png'),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'Improve your English Vocab here',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.w600,
                          color: AppColors.primaryColor),
                    ),
                  ),
                  const Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 35.0, vertical: 10),
                    child: Text(
                      'Free English vocabulary learning platform with many interesting topics',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 14, fontWeight: FontWeight.normal),
                    ),
                  ),
                   SizedBox(
                    height: MediaQuery.of(context).size.width*0.2,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          flex: 1,
                          child: Container(
                            decoration: BoxDecoration(
                                color: AppColors.primaryColor,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: const [
                                  BoxShadow(
                                      color: Colors.black26,
                                      blurRadius: 0.5,
                                      offset: Offset(0, 0.5))
                                ]),
                            child: MaterialButton(
                                onPressed: () {
                                  Get.offAndToNamed(AppRoutes.SIGN_IN);
                                },
                                height: 60,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                textColor: Colors.white,

                                minWidth: double.maxFinite,
                                elevation: 2,
                                color: AppColors.primaryColor,
                                child: const Text("Login",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500))),
                          ),
                        ),
                        const SizedBox(width: 30,),
                        Flexible(
                          flex: 1,
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: const [
                                  BoxShadow(
                                      color: Colors.black26,
                                      blurRadius: 0.5,
                                      offset: Offset(0, 0.5))
                                ]),
                            child: MaterialButton(
                                onPressed: () {
                                  Get.offAndToNamed(AppRoutes.SIGN_UP);
                                },
                                height: 60,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                textColor: AppColors.primaryColor,
                                minWidth: double.maxFinite,
                                elevation: 1,
                                color: Colors.white,
                                child: const Text("Register",
                                    style: TextStyle(
                                        color:  AppColors.primaryColor,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500))),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )),
      ),
    );
  }
}
