import 'dart:convert';
import 'dart:io';
import 'package:client/res/routes/routes.dart';
import 'package:client/res/storage/user_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../res/data/network_api_service.dart';
import 'package:http/http.dart' as http;
import 'package:firebase_storage/firebase_storage.dart';

class PrivateInfoManagementController extends GetxController {
  String avatarPath = 'https://firebasestorage.googleapis.com/v0/b/englishvoc-43d5a.appspot.com/o/images%2FavatarDefault.png?alt=media&token=59aae8c1-2129-46ca-ad75-5dad1b119188';
  String fullName = '';
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  late ValueNotifier<String> dateController = ValueNotifier<String>('');

  final ImagePicker _picker = ImagePicker();

  Future<void> pickImage() async {
    try {
      final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        // Hiển thị trạng thái đang upload ảnh cho người dùng
        Get.defaultDialog(
          radius: 8,
          title: "Uploading",
          middleText: "Please wait while the image is being uploaded.",
          barrierDismissible: false,
        );

        File imageFile = File(pickedFile.path);
        final storageRef = FirebaseStorage.instance.ref("images/").child(pickedFile.name);
        await storageRef.putFile(imageFile);

        final downloadUrl = await storageRef.getDownloadURL();
        print("Đường dẫn nè: " + downloadUrl);

        avatarPath = downloadUrl;
        update();
        Get.back();

        Get.defaultDialog(
          radius: 8,
          title: "Upload Successful",
          middleText: "The image has been uploaded successfully.",
          textConfirm: "OK",
          onConfirm: () {
            Get.back();
          },
        );
      }
    } catch (e) {
      print('Error uploading image: $e');

      Get.defaultDialog(
        radius: 8,
        title: "Upload failed",
        middleText: "An error occurred while uploading the image.",
      );
    }
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
          'dob': dateController.value.toString().trim(),
          'avatar': avatarPath,
        };
        String jsonBody = jsonEncode(information);

        http.Response patchApi = await NetworkApiService().patchApi(
          "/user/$id/update-info",
          jsonBody,
        );

        if (patchApi.statusCode == 200) {
          fullName = nameController.text.trim();
          Get.defaultDialog(
            radius: 8,
            title: "Update successfully!",
            middleText: "You updated successfully.",
            textConfirm: "OK",
            onConfirm: () {
              Get.back();
            },
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
        fullName = currentUserData['fullname'];
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
        dateController.value = currentUserData['dob'];
      }
      avatarPath = currentUserData['avatar'];
    } else {
      print(responseCurrentUser.statusCode);
    }
    update();
  }

  void logOut() {
    UserStore.to.onLogout();
    Get.offAndToNamed(AppRoutes.SIGN_IN);
  }
}
