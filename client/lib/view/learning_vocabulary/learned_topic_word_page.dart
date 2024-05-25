import 'package:client/view/learning_vocabulary/component/CardTopicLearned.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../res/routes/names.dart';
import 'component/CardTopic.dart';
import 'learning_vocabulary_controller.dart';

class LearnedTopicWordPage extends GetView<LearningVocabularyController> {
  const LearnedTopicWordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          padding: EdgeInsets.all(24),
          child: ListView.builder(
              itemCount: controller.listTopicLearnt.length,
              itemBuilder: (context,index) {
                var item =controller.listTopicLearnt[index];


                return GestureDetector(
                  onTap: ()  {
                     // controller.getWordsLeantByTopic(item['topicId']);
                    Get.toNamed(AppRoutes.DETAIL_LEARNED_TOPIC_WORD, preventDuplicates: false, arguments: {
                      "topicId": item['topicId'],
                      "topicImage": item['topicImage']
                    });
                  },
                  child: Container(
                      padding: EdgeInsets.symmetric(vertical: 8),
                      child: CardTopicLearned(item:item)),
                );
              })
      ),
    );
  }
}