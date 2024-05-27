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
  int correctAnswert = 0;
  int showCorrect = 0;
  Color colorChoose = Color(0xffD3EEFB);
  Color colorChooseBorder = Color(0xff04BFD9);
  Color colorChooseText = Color(0xff29ABEA);
  int round = 5;
  int lengthCheck = 0;
  List<dynamic> listTopicExam = [];
  var currentUser;
  List<WordDTO> listWordsExam = [];
  List<Map<String,dynamic>> listRoundExam = [];
  List<Map<String,dynamic>> saveResult = [];
  Map<String,dynamic>? currentQuestion;
  String question = "";
  String answer1 = "";
  String answer2= "";
  String answer3= "";
  String answer4= "";

  int numTrue = 0;

  final NetworkApiService networkApiService = NetworkApiService();

  @override
  void onInit() {
    getAllTopicExam();
  }
  void getAllTopicExam() async{
    http.Response res =await  networkApiService.getApi("/user/current-user");
    if(res.statusCode == HttpStatus.ok){
      Map<String, dynamic> jsonMap = json.decode(utf8.decode(res.bodyBytes));
      currentUser = jsonMap;
      update();
    }
    else{
      Map<String, dynamic> resMessage = json.decode(utf8.decode(res.bodyBytes));
      print(resMessage["message"]);
    }
    res = await networkApiService.getApi("/topic/getAllTopicHasLearntWord");

    if(res.statusCode == HttpStatus.ok){
      Iterable i = json.decode(utf8.decode(res.bodyBytes));

      listTopicExam = i.toList();
      listTopicExam.forEach((element) {
        element['isChoose'] = false;
      });

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
    indexAnswer = index;
    update();
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
    Set<int> chosenIndices = Set();
    while (listWordsExam.length < 10) {
      int number = random.nextInt(listWordsChoose.length);
      if (!chosenIndices.contains(number)) {
        chosenIndices.add(number);
        listWordsExam.add(listWordsChoose[number]);
      }
    }


    listWordsExam.forEach((word) {
      List otherWords = listWordsExam.map((item) => ({
        "wrongId": item.id,
        "wrongName": item.wordName,
        "wrongMean": item.wordMean,
      })).toList();
      otherWords.removeWhere((item) => item["wrongId"] == word.id);
      print(otherWords.length);
      int indexRandomWrongWord1 = random.nextInt(otherWords.length);
      int indexRandomWrongWord2 = (indexRandomWrongWord1+1)%9;
      int indexRandomWrongWord3 = (indexRandomWrongWord1+2)%9;


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

  void nextQuestion() {
    String tmp = '';
    switch (indexAnswer) {
      case 1:
        tmp = answer1;
        break;
      case 2:
        tmp = answer2;
        break;
      case 3:
        tmp = answer3;
        break;
      case 4:
        tmp = answer4;
        break;
    }
    if (indexQuestion>=0) saveResult[indexQuestion]['answer'] = tmp;
    indexQuestion++;
    if (indexQuestion > 9) {


      Get.offAllNamed(AppRoutes.RESULT_TEST, arguments: {
        "saveResult":saveResult
      });

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
      if (indexCorrect==0) {
        answer1 = currentQuestion?['wordMean'];
        answer2 = currentQuestion?['wrongMean1'];
        answer3 = currentQuestion?['wrongMean2'];
        answer4 = currentQuestion?['wrongMean3'];
      }
      else if (indexCorrect==1) {
        answer1 = currentQuestion?['wrongMean1'];
        answer2 = currentQuestion?['wordMean'];
        answer3 = currentQuestion?['wrongMean2'];
        answer4 = currentQuestion?['wrongMean3'];
      }
      else if (indexCorrect==2) {
        answer1 = currentQuestion?['wrongMean1'];
        answer2 = currentQuestion?['wrongMean2'];
        answer3 = currentQuestion?['wordMean'];
        answer4 = currentQuestion?['wrongMean3'];
      }
      else if (indexCorrect == 3) {
        answer1 = currentQuestion?['wrongMean1'];
        answer2 = currentQuestion?['wrongMean2'];
        answer3 = currentQuestion?['wrongMean3'];
        answer4 = currentQuestion?['wordMean'];
      }

    }
    else if (indexTypeQuestion == 1){
      question = currentQuestion?['wordMean'];
      if (indexCorrect==0) {
        answer1 = currentQuestion?['wordName'];
        answer2 = currentQuestion?['wrongName1'];
        answer3 = currentQuestion?['wrongName2'];
        answer4 = currentQuestion?['wrongName3'];
      }
      else if (indexCorrect==1) {
        answer1 = currentQuestion?['wrongName1'];
        answer2 = currentQuestion?['wordName'];
        answer3 = currentQuestion?['wrongName2'];
        answer4 = currentQuestion?['wrongName3'];
      }
      else if (indexCorrect==2) {
        answer1 = currentQuestion?['wrongName1'];
        answer2 = currentQuestion?['wrongName2'];
        answer3 = currentQuestion?['wordName'];
        answer4 = currentQuestion?['wrongName3'];
      }
      else if (indexCorrect == 3) {
        answer1 = currentQuestion?['wrongName1'];
        answer2 = currentQuestion?['wrongName2'];
        answer3 = currentQuestion?['wrongName3'];
        answer4 = currentQuestion?['wordName'];
      }
    }

    correctAnswert = ++indexCorrect;
    String tmp ='';
    switch (correctAnswert) {
      case 1:
        tmp = answer1;
        break;
      case 2:
        tmp = answer2;
        break;
      case 3:
        tmp = answer3;
        break;
      case 4:
        tmp = answer4;
        break;
    }
    saveResult.add({
      "question": question,
      "correctAnswer": tmp
    });
    // colorChoose = Color(0xffD3EEFB);
    // colorChooseBorder = Color(0xff04BFD9);
    // colorChooseText = Color(0xff29ABEA);
    indexAnswer = 0;
    update();



  }




}