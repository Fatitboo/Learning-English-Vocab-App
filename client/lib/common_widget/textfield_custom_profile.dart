import 'package:client/common/app_color.dart';
import 'package:flutter/material.dart';

typedef StringFunction = String? Function(String? value);



class TextFieldCustomProfile extends StatelessWidget {
  late String title;
  late TextEditingController textController;
  late TextInputType keyboardType;
  late bool obscureText;
  StringFunction? validator;

  InputDecoration _inputDecoration() {
    return InputDecoration(
      contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 10),
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

  TextFieldCustomProfile({Key? key,
    required this.title,
    required this.textController,
    required this.keyboardType,
    required this.obscureText,
    this.validator
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
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
          Container(
            child: TextFormField(
              controller: textController,
              obscureText: obscureText,
              keyboardType: keyboardType,
              validator: this.validator,
              decoration: _inputDecoration(),
              cursorColor: AppColors.primaryColor,
              style: const TextStyle(
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

