import 'dart:convert';
import 'dart:io';

import 'package:client/res/data/network_api_service.dart';
import 'package:client/res/model/topic_dto.dart';
import 'package:client/res/model/word_dto.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../res/routes/names.dart';
class SavedTopicController extends GetxController{
  List<dynamic> data = [
    {
      'topicId': "1",
      'topicName': "Technology",
      "topicImage": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcStRKNp4tmeobtRzBVF_2ZVtK1oi3xHSIj8ObvQ-RoJ-Q&s",
      "learnNumber": 120,
      "totalWords": 200,
      "onTap": (){
        print("hello");
      }
    },
    {
      'topicId': "2",
      'topicName': "Event",
      "topicImage": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSjKMOywgpbqFC86EJFObQOBQLl56QtXF0dXWkHp8Z59w&s",
      "learnNumber": 50,
      "totalWords": 210,
      "onTap": (){
        print("hello");
      }
    },
    {
      'topicId': "3",
      'topicName': "Flight",
      "topicImage": "https://www.libertytravel.com/sites/default/files/styles/full_size/public/flight-hero.jpg?itok=hhscHSGZ",
      "learnNumber": 120,
      "totalWords": 200,
      "onTap": (){
        print("hello");
      }
    },
    {
      'topicId': "7",
      'topicName': "Short communication",
      "topicImage": "https://media.dolenglish.vn/PUBLIC/MEDIA/c01336f1-805f-4e72-9c80-f6234a721d3c.jpg",
      "learnNumber": 100,
      "totalWords": 200,
      "onTap": (){
        print("hello");
      }
    },
    {
      'topicId': "4",
      'topicName': "Festival",
      "topicImage": "https://lytuong.net/wp-content/uploads/2022/08/201932615753_4007.jpg",
      "learnNumber": 50,
      "totalWords": 200,
      "onTap": (){
        print("hello");
      }
    },
    {
      'topicId': "5",
      'topicName': "Life style",
      "topicImage": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRlzRkm46qJbhMK0GEn6AxBTNOpkeqO1T43dtBgKqH6qg&s",
      "learnNumber": 100,
      "totalWords": 200,
      "onTap": (){
        print("hello");
      }
    },
    {
      'topicId': "6",
      'topicName': "Travelling",
      "topicImage": "https://bacsiielts.vn/wp-content/uploads/2022/05/ielts-speaking-part-2-travelling.jpg",
      "learnNumber": 50,
      "totalWords": 200,
      "onTap": (){
        print("hello");
      }
    },
  ] ;
  Rx<bool> loading = false.obs;
  RxList listWord = [].obs;
  final NetworkApiService networkApiService = NetworkApiService();


  @override
  void onInit() {
    getAllSavedTopic();
  }


  void getAllSavedTopic() async{
    loading.value = true;
    http.Response res = await networkApiService.getApi("/word/getAllSavedWords/3");
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

  void toDetailTopicPage(String topicId, String topicName) {
    Get.toNamed(AppRoutes.DETAIL_TOPIC, arguments:{
      "topicId": topicId,
      "topicName": topicName
    },
        preventDuplicates: false
    );
  }

  void toggleSavedWord(WordDTO word, int index) async{
    loading.value = true;
    http.Response res = await networkApiService.deleteApi("/store/deleteSavedWord/3/${word.id}");
    if(res.statusCode == HttpStatus.ok){
      listWord.removeAt(index);
      listWord.refresh();
    }
    else{
      Map<String, dynamic> resMessage = json.decode(utf8.decode(res.bodyBytes));
      print(resMessage["message"]);
    }
    loading.value = false;
  }
}