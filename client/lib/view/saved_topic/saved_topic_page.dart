import 'package:client/common_widget/word_widget.dart';
import 'package:client/view/saved_topic/saved_topic_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SavedTopicPage extends GetView<SavedTopicController> {
  SavedTopicPage({super.key});
  //var dt = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Obx(() => SafeArea(
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
                  Container(padding: const EdgeInsets.symmetric(horizontal: 50), child: Text(controller.topicName.value, overflow: TextOverflow.ellipsis, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500,))),
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
                          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                          child: WordWidget(
                              onTap: (){
                                //print(dt);
                                print(controller.topicName.value);
                              },
                              wordName: controller.data[index]["wordName"],
                              wordMean: controller.data[index]["wordMean"],
                              spelling: controller.data[index]["spelling"],
                              image: controller.data[index]["image"],
                              wordType: controller.data[index]["wordType"],
                              audio: controller.data[index]["audio"],
                          ),
                        );
                      }
                  ),
                ),
              ],
            ),
          ),
        )
    ));
  }
}

