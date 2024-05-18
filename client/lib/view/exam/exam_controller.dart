import 'dart:ui';

import 'package:get/get.dart';

import '../../res/routes/names.dart';

class ExamController extends GetxController {
  int indexAnswer = 0;
  String typeQuestion = 'string';
  int sttQuestion = 1;
  int correctAnswert = 2;
  int showCorrect = 0;
  Color colorChoose = Color(0xffD3EEFB);
  Color colorChooseBorder = Color(0xff04BFD9);
  Color colorChooseText = Color(0xff29ABEA);
  int round = 5;
  List<bool> booleanList = List.filled(10, false);
  int lengthCheck = 0;

  void handleCheck(int index, bool value) {
      booleanList[index] = value;
      setLengthCheck();
      update();
  }
  void setLengthCheck () {
    lengthCheck = booleanList.where((element) => element == true).length;
  }

  void setIndexAnswer(index) {
    if (showCorrect!=0) return;
    indexAnswer = index;
    update();
  }

  void nextQuestion() {
    sttQuestion++;
    if (sttQuestion>10) {
      Get.offNamed(AppRoutes.RESULT_TEST);
    }
    update();
  }

  void reset() {
    sttQuestion = 1;
  }

  @override
  void onReady() {
    super.onReady();
    reset();
  }
}