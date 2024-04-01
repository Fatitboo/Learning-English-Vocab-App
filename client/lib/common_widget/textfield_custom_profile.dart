import 'package:client/common/app_color.dart';
import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  final String labelText;
  final TextEditingController controller;
  final bool obscureText;
  final TextInputType keyboardType;

  const CustomInput({
    Key? key,
    required this.labelText,
    required this.controller,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.primaryColor), // Màu xanh khi focus
          ),
        ),
        cursorColor: AppColors.primaryColor,
        style: TextStyle(
          fontSize: 14,
        ),
      ),
    );
  }
}

class TextFieldCustomProfile extends StatefulWidget {
  final String title;

  const TextFieldCustomProfile({Key? key, required this.title}) : super(key: key);

  @override
  _TextFieldCustomProfileState createState() => _TextFieldCustomProfileState();
}

class _TextFieldCustomProfileState extends State<TextFieldCustomProfile> {
  TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.title, // Sử dụng tiêu đề được truyền vào từ widget
            style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10.0),
          CustomInput(
            labelText: widget.title,
            controller: _textController,
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }
}