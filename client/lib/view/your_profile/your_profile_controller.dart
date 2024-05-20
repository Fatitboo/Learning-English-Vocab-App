import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import '../../res/data/network_api_service.dart';
import 'package:http/http.dart' as http;

class YourProfileController extends GetxController {
  String avatarPath = '';
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  ValueNotifier<DateTime> dateController =
      ValueNotifier<DateTime>(DateTime.now());

  final ImagePicker _picker = ImagePicker();

  Future<void> pickImage() async {
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      avatarPath = pickedFile.path;
      update();
    }
  }

  String formatDate(DateTime date) {
    String day = date.day.toString().padLeft(2, '0');
    String month = date.month.toString().padLeft(2, '0');
    String year = date.year.toString();
    return '$day/$month/$year';
  }

  Future<void> updateProfile() async {
    try {
      var responseCurrentUser =
      await NetworkApiService().getApi("/user/current-user");
      if (responseCurrentUser.statusCode == 200) {
        var currentUserData = jsonDecode(responseCurrentUser.body);
        var id = currentUserData['id'];
        var information = {
          'fullname': nameController.text.trim(),
          'email': emailController.text.trim(),
          'phone': phoneController.text.trim(),
          'dob': formatDate(dateController.value).trim(),
        };
        String jsonBody = jsonEncode(information);

        http.Response patchApi = await NetworkApiService().patchApi(
          "/user/$id/update-info",
          jsonBody,
        );

        if (patchApi.statusCode == 200) {
          Get.defaultDialog(
            radius: 8,
            title: "Update successfully!",
            middleText: "You updated successfully.",
            textConfirm: "OK",
          );
        } else {
          Get.defaultDialog(
            radius: 8,
            title: "Update failed!",
            middleText: "Something went wrong.",
          );
        }
      } else {
        Get.defaultDialog(
          radius: 8,
          title: "Error",
          middleText: "Failed to fetch current user.",
        );
      }
    } catch (error) {
      print("Error: $error");
      Get.defaultDialog(
        radius: 8,
        title: "Error",
        middleText: "An error occurred.",
      );
    } finally {
      update();
    }
  }

  @override
  void onInit() {
    super.onInit();
    getCurrentUser();
    update();
  }

  Future<void> getCurrentUser() async {
    var responseCurrentUser =
        await NetworkApiService().getApi("/user/current-user");
    if (responseCurrentUser.statusCode == 200) {
      var currentUserData = jsonDecode(responseCurrentUser.body);
      if (currentUserData['fullname'] != null) {
        nameController.text = currentUserData['fullname'];
      } else {
        nameController.text = "Chưa cập nhật";
      }
      emailController.text = currentUserData['email'];
      if (currentUserData['phone'] != null) {
        phoneController.text = currentUserData['phone'];
      } else {
        phoneController.text = "Chưa cập nhật";
      }
      if (currentUserData['dob'] != null) {
        DateFormat dateFormat = DateFormat("dd/MM/yyyy");
        DateTime dateTime = dateFormat.parse(currentUserData['dob']);
        dateController.value = dateTime;
      }
    } else {
      print(responseCurrentUser.statusCode);
    }
    update();
  }
}

// final linkCloud = Uri.parse('https://api.cloudinary.com/v1_1/dmo9y50zo/image/upload');
// final request = http.MultipartRequest('POST', linkCloud)
//   ..fields['upload_preset'] = 'vpvtwpde'
//   ..files.add(await http.MultipartFile.fromPath('file', pickedFile.path));
//
// final response = await request.send();
// if (response.statusCode == 200) {
// final resData = await response.stream.toBytes();
// final resString = String.fromCharCodes(resData);
// final jsonMap = jsonDecode(resString);
// avatarPath = jsonMap['secure_url'];
