import 'dart:convert';
import 'dart:math';
import 'dart:ui';

import 'package:client/res/model/topic_learn_dto.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';

import '../../res/data/network_api_service.dart';
import '../../res/routes/names.dart';
import 'package:http/http.dart' as http;


class ExamRoundController extends GetxController {
  List<Map<String,dynamic>> listRoundExam = [];
  List<Map<String,dynamic>> saveResult = [];
  int numTrue = 0;





  final NetworkApiService networkApiService = NetworkApiService();

  @override
  void onInit() {
    var args = Get.arguments;
    saveResult = args['saveResult'];
    numTrue = saveResult.where((element) => element['answer'] == element['correctAnswer']).toList().length;
    update();
    if (numTrue >= 8) addScore();
  }
  Future<void> addScore() async{

    http.Response res = await networkApiService.patchApi("/user/addScore",jsonEncode({}));

    if(res.statusCode == HttpStatus.ok){
      print('success');



      update();

    }
    else{
      Map<String, dynamic> resMessage = json.decode(utf8.decode(res.bodyBytes));
      print(resMessage["message"]);
    }
  }







}