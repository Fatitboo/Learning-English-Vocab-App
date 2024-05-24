import 'dart:convert';
import 'dart:math';
import 'dart:ui';

import 'package:client/res/routes/routes.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';
import 'package:http/http.dart' as http;

import '../../../res/data/network_api_service.dart';
import '../../../res/model/word_dto.dart';


class RoundLearnController extends GetxController {
  int topicId = 0;
  int indexAnswer = 0;
  String typeQuestion = 'string';
  int sttQuestion = 0;
  int correctAnswert = 0;
  int showCorrect = 0;
  int round =  5;
  Color colorChoose = Color(0xffD3EEFB);
  Color colorChooseBorder = Color(0xff04BFD9);
  Color colorChooseText = Color(0xff29ABEA);
  final NetworkApiService networkApiService = NetworkApiService();
  List<WordDTO> listWordsNotLearn = [];
  List<Map<String,dynamic>> listRound = [];
  List correctIds = [];

   Map<String,dynamic>? currentQuestion;
   String question = "";
  String answer1 = "";
  String answer2= "";

  @override
  void onInit() async {
    super.onInit();
    var args = Get.arguments;
    topicId = args['topicId'];
     await getWordsNotLearn(topicId);
     initRound();

  }
  void initRound() {
    var random = Random();
    int length = listWordsNotLearn.length;
    listWordsNotLearn.toList().forEach((word) {
      List otherWords = listWordsNotLearn.map((item) => ({
        "wrongId": item.id,
        "wrongName": item.wordName,
        "wrongMean": item.wordMean,
      })).toList();
      otherWords.removeWhere((item) => item["wrongId"] == word.id);
      int indexRandomWrongWord = random.nextInt(otherWords.length);

      Map<String,dynamic> mp = {
        "id": word.id,
        "wordName": word.wordName,
        "wordMean": word.wordMean,
        "spelling": word.spelling,
        "wordType": word.wordType,
        "wrongName": otherWords[indexRandomWrongWord]['wrongName'],
        "wrongMean": otherWords[indexRandomWrongWord]['wrongMean'],
        "isTrue": false,
      };
      listRound.add(mp);
    });
    nextQuestion();



  }

  void setIndexAnswer(index) {
    if (showCorrect!=0) return;
    indexAnswer = index;
    update();
  }

  void nextQuestion() {
    var random = Random();
    if (showCorrect==0) {
      currentQuestion = listRound[0];
    }
    else {
      if (showCorrect==2) {
        int prevId = currentQuestion?['id'];
        var newList = listRound.where((element) => element['id']!=prevId).toList();
        if (newList.length==0) {
          configQuestion();
          return;
        }
        int indexRandomWrongWord = random.nextInt(newList.length);
        currentQuestion = listRound[indexRandomWrongWord];
      }
      else if (showCorrect==1){
        correctIds.add(currentQuestion?['id']);

        listRound.removeWhere((element) => element['id'] == currentQuestion?['id']);
        if (listRound.length==0) {
          Get.offNamed(AppRoutes.CONGRATULATION_ROUND);
          return;
        }
        int indexRandomWrongWord = random.nextInt(listRound.length);
        currentQuestion = listRound[indexRandomWrongWord];

      }
    }

    configQuestion();
  }
  void configQuestion() {

    var random = Random();
    int indexTypeQuestion = random.nextInt(2);
    int indexCorrect = random.nextInt(2);
    if (indexTypeQuestion == 0) {
      question = currentQuestion?['wordName'] + '(${currentQuestion?['wordType']})';
      answer1 = indexCorrect == 0 ? (currentQuestion?['wordMean']) : (currentQuestion?['wrongMean']);
      answer2 = indexCorrect == 0 ? (currentQuestion?['wrongMean']) : (currentQuestion?['wordMean']);
    }
    else if (indexTypeQuestion == 1){
      question = currentQuestion?['wordMean'];
      answer1 = indexCorrect == 0 ? (currentQuestion?['wordName']) : (currentQuestion?['wrongName']);
      answer2 = indexCorrect == 0 ? (currentQuestion?['wrongName']) : (currentQuestion?['wordName']);
    }
    correctAnswert = ++indexCorrect;
    showCorrect = 0;
    indexAnswer = 0;

     colorChoose = Color(0xffD3EEFB);
     colorChooseBorder = Color(0xff04BFD9);
     colorChooseText = Color(0xff29ABEA);

    update();


    // sttQuestion++;
    // if (sttQuestion> listRound.length) {
    //   Get.offNamed(AppRoutes.CONGRATULATION_ROUND);
    // }
    //
    // currentQuestion = listRound[sttQuestion-1];
    //
    // var random = Random();
    // int indexTypeQuestion = random.nextInt(2);
    // int indexCorrect = random.nextInt(2);
    // if (indexTypeQuestion == 0) {
    //   question = currentQuestion?['wordName'] + '(${currentQuestion?['wordType']})';
    //   answer1 = indexCorrect == 0 ? (currentQuestion?['wordMean']) : (currentQuestion?['wrongMean']);
    //   answer2 = indexCorrect == 0 ? (currentQuestion?['wrongMean']) : (currentQuestion?['wordMean']);
    // }
    // else if (indexTypeQuestion == 1){
    //   question = currentQuestion?['wordMean'];
    //   answer1 = indexCorrect == 0 ? (currentQuestion?['wordName']) : (currentQuestion?['wrongName']);
    //   answer2 = indexCorrect == 0 ? (currentQuestion?['wrongName']) : (currentQuestion?['wordName']);
    // }
    // correctAnswert = ++indexCorrect;
    // showCorrect = 0;
    // indexAnswer = 0;
    //
    //  colorChoose = Color(0xffD3EEFB);
    //  colorChooseBorder = Color(0xff04BFD9);
    //  colorChooseText = Color(0xff29ABEA);
    //
    // update();
  }

  void check() {
    if (indexAnswer==correctAnswert) {
        showCorrect = 1;
        colorChoose = Color(0xffC6FFC1);
        colorChooseBorder = Color(0xff60DE04);
        colorChooseText = Color(0xff3E8C05);

    }
    else {
      showCorrect = 2;
      colorChoose = Color(0xFFFFCCCC);
      colorChooseBorder = Color(0xffFF8B8B);
      colorChooseText = Color(0xffDE0606);

    }
    update();
  }
  Future<void>  getWordsNotLearn(topicId) async {
    http.Response res = await networkApiService.getApi("/word/getAllWordNotLearnByTopic/$topicId");

    if(res.statusCode == HttpStatus.ok){
      Iterable i = json.decode(utf8.decode(res.bodyBytes));
        listWordsNotLearn =  List<WordDTO>.from(i.map((model)=> WordDTO.fromJson(model))).toList();
    }
    else{
      Map<String, dynamic> resMessage = json.decode(utf8.decode(res.bodyBytes));
      print(resMessage["message"]);
    }
  }


}