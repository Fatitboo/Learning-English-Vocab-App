import 'dart:convert';
import 'dart:io';
import 'package:client/res/data/network_api_service.dart';
import 'package:client/res/model/topic_dto.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../res/routes/names.dart';
class HomeController extends GetxController{
  Rx<bool> loading = false.obs;
  RxList listTopic = [].obs;
  late final NetworkApiService networkApiService = NetworkApiService();


  @override
  void onInit() {
    getAllTopic();
  }

  void toDetailTopicPage(int topicId, String topicName) {
    Get.toNamed(AppRoutes.DETAIL_TOPIC, arguments:{
        "topicId": topicId,
        "topicName": topicName
      },
      preventDuplicates: false
    );
  }

  void getAllTopic() async{
    loading.value = true;
    http.Response res = await networkApiService.getApi("/topic/getAllTopic");
    loading.value = false;
    if(res.statusCode == HttpStatus.ok){
      Iterable i = json.decode(utf8.decode(res.bodyBytes));
      List<TopicDTO> topics = List<TopicDTO>.from(i.map((model)=> TopicDTO.fromJson(model))).toList();
      listTopic.value = topics;
      print(listTopic);
    }
    else{
      Map<String, dynamic> resMessage = json.decode(utf8.decode(res.bodyBytes));
      print(resMessage["message"]);
    }
  }
}