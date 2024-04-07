
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
                itemCount: 12,
                itemBuilder: (context,index) {
                  return Container(
                      padding: EdgeInsets.symmetric(vertical: 8),
                      child: CardTopic());
                })
        ),
      ),
    );
  }
}
