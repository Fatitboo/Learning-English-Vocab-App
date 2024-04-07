import 'package:client/view/learning_vocabulary/component/CardTopicLearned.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
              itemCount: 12,
              itemBuilder: (context,index) {
                return Container(
                    padding: EdgeInsets.symmetric(vertical: 8),
                    child: CardTopicLearned());
              })
      ),
    );
  }
}