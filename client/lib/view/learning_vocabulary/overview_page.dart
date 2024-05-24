
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
                  return

                     GestureDetector(
                       onTap: () {
                         controller.goToRoundLearn(index);

                       },
                       child: Container(
                          padding: EdgeInsets.symmetric(vertical: 8),
                          child: CardTopic(item: controller.listTopicLearnt[index],)),
                     );

                })
        ),
      ),
    );
  }
}
