import 'package:client/res/data/network_api_service.dart';
import 'package:client/res/model/user_model.dart';
import 'package:get/get.dart';
import 'dart:convert';

class StatiscalController extends GetxController {
  var allUsers = <User>[].obs;
  var fullname = ''.obs;
  var score = 0.obs;
  var avatarPath = ''.obs;
  var totalTopicCompleted = 0.obs;
  var totalWordLearned = 0.obs;
  var totalInProcessTopicsCount = 0.obs;

  @override
  void onInit() {
    super.onInit();
    fetchAllUsers();
    getUserStatistics();
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
  }

  void setAllUsers(List<User> users) {
    allUsers.value = users;
  }

  Future<void> getUserStatistics() async {
    try {
      var responseCurrentUser = await NetworkApiService().getApi("/user/current-user");
      if (responseCurrentUser.statusCode == 200) {
        var currentUserData = jsonDecode(responseCurrentUser.body);
        var id = currentUserData["id"];
        fullname.value = currentUserData["fullname"];
        score.value = currentUserData["score"];
        avatarPath.value = currentUserData["avatar"];

        var response = await NetworkApiService().getApi("/user/$id/statistics");
        if (response.statusCode == 200) {
          var data = jsonDecode(response.body);
          totalTopicCompleted.value = data["completedTopicsCount"];
          totalWordLearned.value = data["learntWordsCount"];
          totalInProcessTopicsCount.value = data["inProcessTopicsCount"];
        } else {
          Get.snackbar('Error', 'Failed to load user statistics');
        }
      } else {
        Get.snackbar('Error', 'Failed to load current user');
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to load user statistics: $e');
    }
  }
}
