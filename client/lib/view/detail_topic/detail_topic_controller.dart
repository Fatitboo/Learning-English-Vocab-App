import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../res/data/network_api_service.dart';
import '../../res/model/word_dto.dart';
class DetailTopicController extends GetxController{
  Rx<bool> loading = false.obs;
  RxList listWord = [].obs;
  Rx<String> topicName = "".obs;
  Rx<int> topicId = 0.obs;
  final NetworkApiService networkApiService = NetworkApiService();


  List<dynamic> data = [].obs;

  @override
  void onInit() {
    super.onInit();
    var args = Get.arguments;
    topicName.value = args['topicName'];
    topicId.value = args['topicId'];
    getWordsFromTopic(topicId.value);
  }

  void getWordsFromTopic(int id) async {
    loading.value = true;
    http.Response res = await networkApiService.getApi("/word/getAllWordFromTopic/$id");
    loading.value = false;
    if(res.statusCode == HttpStatus.ok){
      Iterable i = json.decode(utf8.decode(res.bodyBytes));
      List<WordDTO> words = List<WordDTO>.from(i.map((model)=> WordDTO.fromJson(model))).toList();
      listWord.value = words;
    }
    else{
      Map<String, dynamic> resMessage = json.decode(utf8.decode(res.bodyBytes));
      print(resMessage["message"]);
    }
  }
}