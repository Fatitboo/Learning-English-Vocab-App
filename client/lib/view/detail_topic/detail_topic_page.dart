import 'package:client/common_widget/word_widget.dart';
import 'package:client/res/model/word_dto.dart';
import 'package:client/res/routes/names.dart';
import 'package:client/view/detail_topic/detail_topic_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailTopicPage extends GetView<DetailTopicController> {
  DetailTopicPage({super.key});
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
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: GestureDetector(
                        onTap: (){
                          Get.toNamed(AppRoutes.FLASH_CARD, arguments: {'wordList': controller.listWord.value, 'allWord': controller.listWord.value});
                        },
                        child: const Image(
                            width: 24,
                            height: 24,
                            image: AssetImage('assets/icons/flashcard.png')
                        ),
                      ),
                    ),
                  ),
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
                      itemCount: controller.listWord.length,
                      itemBuilder: (BuildContext context, int index) {
                        WordDTO wordDTO = controller.listWord.value[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                          child: WordWidget(
                              onTap: (){
                                print(controller.topicName.value);
                              },
                              onTapStar: () {
                                controller.toggleSavedWord(wordDTO!, index);
                              },
                              wordName: wordDTO.wordName ?? '',
                              wordMean: wordDTO.wordMean ?? '',
                              spelling: wordDTO.spelling ?? '',
                              image: wordDTO.image ?? '',
                              wordType: wordDTO.wordType ?? '',
                              audio: wordDTO.audio ?? '',
                              saved: wordDTO.saved ?? false,

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

