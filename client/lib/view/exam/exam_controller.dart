import 'dart:convert';
import 'dart:math';
import 'dart:ui';

import 'package:client/res/model/topic_learn_dto.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';

import '../../res/data/network_api_service.dart';
import '../../res/routes/names.dart';
import 'package:http/http.dart' as http;


class ExamController extends GetxController {
  int indexAnswer = 0;
  String typeQuestion = 'string';
  int indexQuestion = -1;
  int correctAnswert = 2;
  int showCorrect = 0;
  Color colorChoose = Color(0xffD3EEFB);
  Color colorChooseBorder = Color(0xff04BFD9);
  Color colorChooseText = Color(0xff29ABEA);
  int round = 5;
  int lengthCheck = 0;
  List<dynamic> listTopicExam = [];
  List<WordDTO> listWordsExam = [];
  List<Map<String,dynamic>> listRoundExam = [];
  Map<String,dynamic>? currentQuestion;
  String question = "";
  String answer1 = "";
  String answer2= "";
  String answer3= "";

  final NetworkApiService networkApiService = NetworkApiService();

  @override
  void onInit() {
    getAllTopicExam();
  }
  void getAllTopicExam() async{

    http.Response res = await networkApiService.getApi("/topic/getAllTopicHasLearntWord");

    if(res.statusCode == HttpStatus.ok){
      Iterable i = json.decode(utf8.decode(res.bodyBytes));

      listTopicExam = i.toList();
      listTopicExam.forEach((element) {
        element['isChoose'] = false;
      });
      update();
      print(listTopicExam);

      // listTopicLearnt.forEach((topic) {
      //   if (topic['learntWords'].toInt()==topic['totalWords'].toInt()) indexBlock++;
      // });
      // if (indexBlock==0) indexBlock++;

      update();

    }
    else{
      Map<String, dynamic> resMessage = json.decode(utf8.decode(res.bodyBytes));
      print(resMessage["message"]);
    }
  }
  void handleCheck(int index, bool value) {
    listTopicExam[index]['isChoose'] = value;
      setLengthCheck();
      update();
  }
  void setLengthCheck () {
    lengthCheck = listTopicExam.where((element) => element['isChoose'] == true).length;
  }

  void setIndexAnswer(index) {
    if (showCorrect!=0) return;
    indexAnswer = index;
    update();
  }

  void nextQuestion() {
    indexQuestion++;
    if (indexQuestion > 9) {
      Get.offNamed(AppRoutes.RESULT_TEST);
      return;
    }
    currentQuestion = listRoundExam[indexQuestion];

    configQuestion();
  }
  void configQuestion() {

    var random = Random();
    int indexTypeQuestion = random.nextInt(2);
    int indexCorrect = random.nextInt(4);
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

  void reset() {
    sttQuestion = 1;
  }

  @override
  void onReady() {
    super.onReady();
    reset();
  }
  void shuffleList<T>(List<T> list) {
    final random = Random();
    for (var i = list.length - 1; i > 0; i--) {
      final j = random.nextInt(i + 1);
      final temp = list[i];
      list[i] = list[j];
      list[j] = temp;
    }
  }

  void initExam() {
    var listTopicChoose = listTopicExam.where((element) => element['isChoose'] == true).toList();
    var listWordsChoose = [];
    listTopicChoose.forEach((element) {
      var tmp = List<WordDTO>.from(element['words'].map((model)=> WordDTO.fromJson(model))).toList();
      listWordsChoose.addAll(tmp);
    });
    shuffleList(listWordsChoose);
    var random = Random();
    for (int i=0; i<=9; i++) {
      int number = random.nextInt(listWordsChoose.length);
      listWordsExam.add(listWordsChoose[number]);
    }

    listWordsExam.forEach((word) {
      List otherWords = listWordsExam.map((item) => ({
        "wrongId": item.id,
        "wrongName": item.wordName,
        "wrongMean": item.wordMean,
      })).toList();
      otherWords.removeWhere((item) => item["wrongId"] == word.id);
      int indexRandomWrongWord1 = random.nextInt(otherWords.length);
      int indexRandomWrongWord2 = (indexRandomWrongWord1+1)%10;
      int indexRandomWrongWord3 = (indexRandomWrongWord1+2)%10;

      Map<String,dynamic> mp = {
        "id": word.id,
        "wordName": word.wordName,
        "wordMean": word.wordMean,
        "spelling": word.spelling,
        "wordType": word.wordType,
        "wrongName1": otherWords[indexRandomWrongWord1]['wrongName'],
        "wrongMean1": otherWords[indexRandomWrongWord1]['wrongMean'],
        "wrongName2": otherWords[indexRandomWrongWord2]['wrongName'],
        "wrongMean2": otherWords[indexRandomWrongWord2]['wrongMean'],
        "wrongName3": otherWords[indexRandomWrongWord3]['wrongName'],
        "wrongMean3": otherWords[indexRandomWrongWord3]['wrongMean'],
        "isTrue": false,
      };
      listRoundExam.add(mp);
    });
    nextQuestion();
  }
}