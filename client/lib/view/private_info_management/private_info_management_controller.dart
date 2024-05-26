import 'package:get/get.dart';
import 'dart:convert';
import '../../res/data/network_api_service.dart';

class PrivateInfoManagementController extends GetxController {
  String avatarPath = 'https://i.pinimg.com/736x/0d/64/98/0d64989794b1a4c9d89bff571d3d5842.jpg';
  String userName = '';

  void setAvatarPath(String path) {
    avatarPath = path;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    getCurrentUser();
    update();
  }

  Future<void> getCurrentUser() async {
    var responseCurrentUser = await NetworkApiService().getApi("/user/current-user");
    if (responseCurrentUser.statusCode == 200) {
      var currentUserData = jsonDecode(responseCurrentUser.body);
      userName = currentUserData['username'];
      avatarPath = currentUserData['avatar'];
      print("Current user: " +  userName);
    } else {
      print(responseCurrentUser.statusCode);
    }
    update();
  }
}
