import 'dart:ui';

import 'package:client/res/routes/routes.dart';
import 'package:get/get.dart';

class RoundLearnController extends GetxController {
  int indexAnswer = 0;
  String typeQuestion = 'string';
  int sttQuestion = 1;
  int correctAnswert = 2;
  int showCorrect = 0;
  Color colorChoose = Color(0xffD3EEFB);
  Color colorChooseBorder = Color(0xff04BFD9);
  Color colorChooseText = Color(0xff29ABEA);
  int round = 5;

  void setIndexAnswer(index) {
    if (showCorrect!=0) return;
    indexAnswer = index;
    update();
  }

  void nextQuestion() {
    sttQuestion++;
    if (sttQuestion>10) {
      Get.offNamed(AppRoutes.CONGRATULATION_ROUND);
    }
    update();
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
    };
    update();
  }
}