import 'package:client/view/forgot_password_view.dart';
import 'package:client/view/login_view.dart';
import 'package:client/view/password_management_view.dart';
import 'package:client/view/sign_up_view.dart';
import 'package:client/view/welcome_view.dart';
import 'package:client/view/your_profile_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          fontFamily: "Poppins"),
      home: PasswordManagementView(),
    );
  }
}
