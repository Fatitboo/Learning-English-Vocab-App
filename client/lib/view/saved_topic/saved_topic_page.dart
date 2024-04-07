import 'package:client/view/saved_topic/saved_topic_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common_widget/topic_widget.dart';

class SavedTopicPage extends GetView<SavedTopicController> {
  SavedTopicPage({super.key});
  //var dt = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: Container(
            margin: const EdgeInsets.symmetric(vertical: 24),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Stack(alignment: Alignment.center,children: <Widget>[
                  Container(padding: const EdgeInsets.symmetric(horizontal: 50), child: const Text("Saved topic", overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500,))),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      padding: const EdgeInsets.only(left: 10),
                      child: BackButton(onPressed: () {
                        Get.back();
                      },),
                    ),
                  ),
                ]),
                Expanded(
                  child: ListView.builder(
                      itemCount: controller.data.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                          child: TopicWidget(
                              topicName: controller.data[index]["topicName"],
                              topicImage: controller.data[index]["topicImage"],
                              learnNumber: controller.data[index]["learnNumber"],
                              totalWords: controller.data[index]["totalWords"],
                              onTap: (){
                                controller.toDetailTopicPage(controller.data[index]["topicId"], controller.data[index]["topicName"]);
                              }
                          ),
                        );
                      }
                  ),
                ),
              ],
            ),
          ),
        )
    );
  }
}

