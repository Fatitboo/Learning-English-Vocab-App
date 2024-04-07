import 'package:flutter/material.dart';

import '../common/app_color.dart';

class MyTextField extends StatefulWidget {
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final String hintText;
  final bool isPass;
  final EdgeInsets? margin;
  final Widget? prefixIcon;

  final bool checkBlank;
  final bool checkEmail;
  final int checkLength;
  const MyTextField(
      {super.key,
      required this.hintText,
      this.controller,
      this.margin,
      this.keyboardType,
      this.prefixIcon,
      this.isPass = false,
      this.checkBlank = true,
      this.checkEmail = false,
      this.checkLength = 0});

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  bool obscureText = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(6)),
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        controller: widget.controller,
        obscureText: widget.isPass ? !obscureText : false,
        style: const TextStyle(fontSize: 16),
        validator: (value) {
          if (widget.checkBlank) {
            if (value!.isEmpty) {
              return "Please enter ${widget.hintText}!";
            }
          }
          if (widget.checkEmail) {
            bool emailValid = RegExp(
                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                .hasMatch(value!);
            if (!emailValid) {
              return "Enter Valid email ";
            }
          }
          if (widget.checkLength != 0) {
            if (widget.controller!.text.length < widget.checkLength) {
              return "${widget.hintText} length not be less than ${widget.checkLength} characters.";
            }
          }
        },
        decoration: InputDecoration(
            labelText: widget.hintText,
            suffixIcon: widget.isPass
                ? Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      InkWell(
                          onTap: () {
                            setState(() {
                              obscureText = !obscureText;
                            });
                          },
                          child: Icon(
                            obscureText
                                ? Icons.visibility_off
                                : Icons.visibility,
                          )),
                    ],
                  )
                : null,
            prefixIcon: widget.prefixIcon,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 16, horizontal: 15),
            border: OutlineInputBorder(
               borderRadius: BorderRadius.circular(6),
              borderSide: const BorderSide(color: AppColors.primaryColor,width: 1)

            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: const BorderSide(
                color: AppColors.primaryColor,
                width: 2,

              )
            ),

            errorStyle: TextStyle(color: Colors.red,  ),
            labelStyle: TextStyle( color: AppColors.primaryColor, ),


            hintStyle: const TextStyle(color: Colors.grey, fontSize: 13)),
      ),
    );
  }
}
