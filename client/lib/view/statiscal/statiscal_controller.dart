import 'package:client/res/data/network_api_service.dart';
import 'package:client/res/model/user_model.dart';
import 'package:get/get.dart';
import 'dart:convert';

class StatiscalController extends GetxController {
  var allUsers = <User>[];
  var fullname = '';
  var score = 0;
  var avatarPath = '';
  var totalTopicCompleted = 0;
  var totalWordLearned = 0;
  var totalInProcessTopicsCount = 0;

  @override
  void onInit() {
    super.onInit();
    fetchAllUsers();
    getUserStatistics();
    update();
  }

  Future<void> fetchAllUsers() async {
    try {
      var response = await NetworkApiService().getApi("/user/get_all_users");
      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        List<User> users = data.map((user) => User.fromJson(user)).toList();
        setAllUsers(users);
      } else {
        Get.snackbar('Error', 'Failed to load users');
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to load users: $e');
    }
    update();
  }

  void setAllUsers(List<User> users) {
    allUsers = users;
  }

  Future<void> getUserStatistics() async {
    try {
      var responseCurrentUser = await NetworkApiService().getApi("/user/current-user");
      if (responseCurrentUser.statusCode == 200) {
        var currentUserData = jsonDecode(responseCurrentUser.body);
        var id = currentUserData["id"];
        fullname = currentUserData["fullname"];
        score = currentUserData["score"];
        avatarPath = currentUserData["avatar"];
        var response = await NetworkApiService().getApi("/user/$id/statistics");
        if (response.statusCode == 200) {
          var data = jsonDecode(response.body);
          totalTopicCompleted = data["completedTopicsCount"];
          totalWordLearned = data["learntWordsCount"];
          totalInProcessTopicsCount = data["inProcessTopicsCount"];
        } else {
          Get.snackbar('Error', 'Failed to load user statistics');
        }
      } else {
        Get.snackbar('Error', 'Failed to load current user');
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to load user statistics: $e');
    }
    update();
  }
}
