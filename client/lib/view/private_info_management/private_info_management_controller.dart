import 'package:get/get.dart';
import 'dart:convert';
import '../../res/data/network_api_service.dart';

class PrivateInfoManagementController extends GetxController {
  String avatarPath = '';
  String userName = '';

  void setAvatarPath(String path) {
    avatarPath = path;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    getCurrentUser();
  }

  Future<void> getCurrentUser() async {
    var responseCurrentUser = await NetworkApiService().getApi("/user/current-user");
    if (responseCurrentUser.statusCode == 200) {
      var currentUserData = jsonDecode(responseCurrentUser.body);
      userName = currentUserData['username'];
      print("Current user: " +  userName);
    } else {
      print(responseCurrentUser.statusCode);
    }
    update();
  }
}
