
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../res/routes/names.dart';
import 'component/CardTopic.dart';
import 'learning_vocabulary_controller.dart';

class OverViewPage extends StatelessWidget {
  OverViewPage({super.key});
  final controller = Get.put(LearningVocabularyController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
            padding: EdgeInsets.all(24),
            child: ListView.builder(
                itemCount: controller.listTopicLearnt.length,
                itemBuilder: (context,index) {
                  var item =controller.listTopicLearnt[index];
                  int totalWords = item['totalWords'].toInt();
                  int learntWords =  item['learntWords'].toInt();
                  int numberOfRounds = totalWords%10 == 0 ?totalWords~/10 : (totalWords~/10 + 1);
                  int currentRound = learntWords == totalWords ? numberOfRounds : learntWords~/10;
                  return

                     GestureDetector(
                       onTap: () {
                         if (index >= controller.indexBlock) return;
                         controller.goToRoundLearn(index,currentRound+1,numberOfRounds);

                       },
                       child: Container(
                          padding: EdgeInsets.symmetric(vertical: 8),
                          child: CardTopic(item: item, currentRound: currentRound, numberOfRounds: numberOfRounds, indexBlock: controller.indexBlock, index: index,)),
                     );

                })
        ),
      ),
    );
  }
}
