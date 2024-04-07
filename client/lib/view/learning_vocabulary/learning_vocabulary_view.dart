import 'package:client/common/app_color.dart';
import 'package:client/view/learning_vocabulary/learned_topic_word_page.dart';
import 'package:client/view/learning_vocabulary/learning_vocabulary_controller.dart';
import 'package:client/view/learning_vocabulary/overview_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class LearningVocabularyView extends GetView<LearningVocabularyController> {
  const LearningVocabularyView({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    Get.lazyPut<LearningVocabularyController>(() => LearningVocabularyController());
    return GetBuilder<LearningVocabularyController>(builder: (_) {
      return SafeArea(
          child: DefaultTabController(
            length: 2,
            child: Scaffold(
                appBar: AppBar(
                  centerTitle: true,
                  title: const Text('HỌC TỪ VỰNG',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                    ),),
                  leading: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.arrow_back),
                  ),
                  bottom: const TabBar(
                    labelColor: AppColors.primaryOrange,
                    indicator: UnderlineTabIndicator(
                        borderSide: BorderSide(
                            width: 2,
                            color: AppColors.primaryOrange
                        )
                    ),
                    tabs: [
                      SizedBox(
                          width: double.maxFinite,
                          child: Tab(child: Text('Tổng quan',
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300),),))
                      ,
                      SizedBox(
                          width: double.maxFinite,
                          child: Tab(child: Text('Từ đã học',
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300),),))
                      ,
                    ],
                  ),
                ),
                body:TabBarView(
                  children: [
                    OverViewPage(),
                    LearnedTopicWordPage()
                  ],
                )
            ),
          ));
    });

  }
}
