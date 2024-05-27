
import 'dart:convert';


import 'package:client/res/routes/names.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';
import 'package:http/http.dart' as http;

import '../../res/data/network_api_service.dart';

class LearningVocabularyController extends GetxController with StateMixin{
  LearningVocabularyController();
  int _a = 5;
  int get a => _a;
  List<dynamic> listTopicLearnt = [];
  int indexBlock = 0;

  void increase() {
    _a++;
    update();
    print(a);
  }
  final NetworkApiService networkApiService = NetworkApiService();
  @override
  void onInit() {
    getAllTopicLearnt();
  }



  void getAllTopicLearnt() async{
    indexBlock = 0;
    http.Response res = await networkApiService.getApi("/topic/getWordsLearnedGroupedByTopic");

    if(res.statusCode == HttpStatus.ok){
      Iterable i = json.decode(utf8.decode(res.bodyBytes));

      listTopicLearnt = i.toList();
      listTopicLearnt.forEach((topic) {
        if (topic['learntWords'].toInt()==topic['totalWords'].toInt()) indexBlock++;
      });
       indexBlock++;

      update();

    }
    else{
      Map<String, dynamic> resMessage = json.decode(utf8.decode(res.bodyBytes));
      print(resMessage["message"]);
    }
  }
  void goToRoundLearn(int index, int nextRound, int numberOfRounds) async {
    int topicId = listTopicLearnt[index]['topicId'];
    final result = await Get.toNamed(AppRoutes.ROUND_LEARN, preventDuplicates: true, arguments:{
      "topicId": topicId,
      "nextRound": nextRound,
      "numberOfRounds": numberOfRounds
    });
    if (result == 'backToLearningController') {

      getAllTopicLearnt();
    }

  }
}