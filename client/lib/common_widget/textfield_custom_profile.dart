import 'package:client/common/app_color.dart';
import 'package:flutter/material.dart';


class TextFieldCustomProfile extends StatelessWidget {
  late String title;
  late TextEditingController textController;
  late TextInputType keyboardType;
  late bool obscureText;

  TextFieldCustomProfile({Key? key,
    required this.title,
    required this.textController,
    required this.keyboardType,
    required this.obscureText,
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
            height: 50,
            child: TextFormField(
              controller: textController,
              obscureText: obscureText,
              keyboardType: keyboardType,
              decoration: const InputDecoration(
                contentPadding:
                EdgeInsets.symmetric(vertical: 16, horizontal: 15),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black26),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.primaryColor,width: 1), // Màu xanh khi focus
                ),
              ),
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

