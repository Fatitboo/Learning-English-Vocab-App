import 'package:client/common/app_color.dart';
import 'package:flutter/material.dart';

typedef StringFunction = String? Function(String? value);

class TextFieldCustomProfile extends StatelessWidget {
  final String title;
  final TextEditingController textController;
  final TextInputType keyboardType;
  final bool obscureText;
  final String? initialValue;
  final StringFunction? validator;

  InputDecoration _inputDecoration() {
    return InputDecoration(
      contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.primaryColor),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.red),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.red),
      ),
    );
  }

  TextFieldCustomProfile({
    Key? key,
    required this.title,
    required this.textController,
    required this.keyboardType,
    required this.obscureText,
    this.initialValue,
    this.validator,
  }) : super(key: key) {
    // Initialize the controller with the initial value if provided
    if (initialValue != null) {
      textController.text = initialValue!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10.0),
          TextFormField(
            controller: textController,
            obscureText: obscureText,
            keyboardType: keyboardType,
            validator: validator,
            decoration: _inputDecoration(),
            cursorColor: AppColors.primaryColor,
            style: const TextStyle(
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
