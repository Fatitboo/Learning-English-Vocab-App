import 'dart:collection';
import 'package:client/common_widget/my_button.dart';
import 'package:client/res/routes/names.dart';
import 'package:client/view/flashcard/flashcard_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import '../../common/app_color.dart';
import '../../res/model/word_dto.dart';

class ResultFlashCard extends GetView<FlashCardController>{
  final List<WordDTO> allWord = Get.arguments['allWord'];
  final List<WordDTO> wordList = Get.arguments['wordList'];
  final Queue<WordDTO> laterQueue = Get.arguments['laterQueue'];
  final Queue<WordDTO> rememberQueue = Get.arguments['rememberQueue'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Review", style: TextStyle(fontWeight: FontWeight.w500),),
        centerTitle: true,
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Column(
              children: [
                Column(
                  children: [
                    Column(
                      children: [
                        const SizedBox(height: 15,),
                        Row(
                          children: [
                            const SizedBox(width: 15,),
                            const Expanded(child: SizedBox(child: Text("You're doing great! Keep focusing on your touch terms", overflow: TextOverflow.ellipsis, maxLines: 3, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),))),
                            const SizedBox(width: 15,),
                            Image.asset('assets/images/congratulation.jpg', width: 100, height: 100,),
                            const SizedBox(width: 15,),

                          ],
                        ),
                        const SizedBox(height: 60,),
                        Row(
                          children: [
                            const SizedBox(width: 30,),
                            CircularPercentIndicator(
                              radius: 60.0,
                              lineWidth: 10.0,
                              percent: double.parse((rememberQueue.length / (rememberQueue.length + laterQueue.length)).toStringAsFixed(2)),
                              center: Text("${(rememberQueue.length * 100 / (rememberQueue.length + laterQueue.length)).toStringAsFixed(0)}%", style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),),
                              progressColor: Colors.greenAccent,
                              backgroundColor: Colors.orange,
                            ),
                            const SizedBox(width: 45,),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text("Know", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: const Color(0xff1CD0AF)),),
                                      Container(
                                        width: 24,
                                        height: 24,
                                        decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.all(Radius.circular(50)),
                                          border: Border.all(color: const Color(0xff1CD0AF)),
                                          color: Colors.greenAccent.withOpacity(0.1)
                                        ),
                                        child: Center(child: Text("${rememberQueue.length}", style: TextStyle(color: const Color(0xff1CD0AF), fontWeight: FontWeight.w500, fontSize: 16),))
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 15,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text("Still learning", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: const Color(0xffFF8838)),),
                                      Container(
                                          width: 24,
                                          height: 24,
                                          decoration: BoxDecoration(
                                              borderRadius: const BorderRadius.all(Radius.circular(50)),
                                              border: Border.all(color: const Color(0xffFF8838)),
                                              color: Colors.orangeAccent.withOpacity(0.1)
                                          ),
                                          child: Center(child: Text("${laterQueue.length}", style: const TextStyle(color: Color(0xffFF8838), fontWeight: FontWeight.w500, fontSize: 16),))
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 20,),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 130,
                padding: const EdgeInsets.symmetric(horizontal: 15),
                margin: const EdgeInsets.only(bottom: 30),
                child: Column(
                  children: [
                    MyButton(text: laterQueue.isEmpty ? "Finish" : "Keep reviewing terms", onTap: () {
                      if(laterQueue.isEmpty){
                          Get.back();
                      }
                      else{
                        Get.offAndToNamed(AppRoutes.FLASH_CARD, arguments: {'wordList': laterQueue.toList(), 'allWord': allWord});
                      }
                    }),
                    const SizedBox(height: 10,),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.black26,
                                blurRadius: 0.5,
                                offset: Offset(0, 0.5))
                          ]),
                      child: MaterialButton(
                          onPressed: () {
                            Get.offAndToNamed(AppRoutes.FLASH_CARD, arguments: {'wordList': allWord, 'allWord': allWord});
                          },
                          height: 60,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                          minWidth: double.maxFinite,
                          elevation: 2,
                          color: Colors.white,
                          child:  const Text("Restart Flashcards",
                              style: TextStyle(
                                  color: AppColors.primaryColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500))),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}