import 'package:flutter/material.dart';

import '../common/app_color.dart';

class MyButton extends StatelessWidget {
  const MyButton({super.key, required this.text, required this.onTap});
  final String text;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
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
            onTap();
          },
          height: 60,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)),
          textColor: Colors.white,
          minWidth: double.maxFinite,
          elevation: 2,
          color: AppColors.primaryColor,
          child:  Text(text,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w500))),
    );
  }
}
