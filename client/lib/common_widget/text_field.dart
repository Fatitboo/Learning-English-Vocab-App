import 'package:flutter/material.dart';

import '../common/app_color.dart';

class MyTextField extends StatelessWidget {

  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final String hintText;
  final bool obscureText;
  final EdgeInsets? margin;
  const MyTextField(
      {super.key,
        required this.hintText,
        this.controller,
        this.margin,
        this.keyboardType,
        this.obscureText = false,
      });
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12)),
      child: TextField(
        keyboardType: TextInputType.emailAddress,
        controller:controller,
        obscureText: false,
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(
                vertical: 15, horizontal: 15),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide:
              const BorderSide(color: Colors.grey),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(
                  color: AppColors.primaryColor),
            ),
            hintText: hintText,
            hintStyle: const TextStyle(
                color: Colors.grey, fontSize: 14)),
      ),
    );
  }
}
