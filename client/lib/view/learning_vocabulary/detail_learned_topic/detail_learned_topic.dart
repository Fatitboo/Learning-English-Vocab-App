import 'package:client/common/app_color.dart';
import 'package:client/view/learning_vocabulary/detail_learned_topic/detail_learned_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../common_widget/word_widget.dart';
import '../component/CardTopic.dart';

class DetailLearnedTopic extends GetView<DetailLearnedController> {
  DetailLearnedTopic({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut<DetailLearnedController>(() => DetailLearnedController());
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'TỪ ĐÃ HỌC',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Color(0xff000000).withOpacity(0.2),
                offset: Offset(0, 0),
                blurRadius: 4,
              )
            ]),
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      'assets/images/topic.png',
                      width: 70,
                      height: 70,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      padding: const EdgeInsets.only(left: 16, right: 30),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            'TOPIC',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Color(0xff252526)),
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Text(
                            '123 words',
                            style: TextStyle(color: Color(0xff4D4D4F)),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                width: Get.width,
                height: 1,
                color: Colors.black,
                margin: EdgeInsets.symmetric(vertical: 16),
              ),
              TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                        color: Colors.green,
                        width: 1,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                        color: Color(0xffF3AE29),
                        width: 1,
                      ),
                    ),
                    hintText: 'Enter word',
                    contentPadding: const EdgeInsets.all(12),
                    hintStyle:
                        const TextStyle(color: Color(0xff7D7D7E), fontSize: 14),
                    suffixIcon: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.search),
                    )),
              ),
              SizedBox(height: 16,),
              Expanded(
                  child: ListView.builder(
                      itemCount: controller.data.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.symmetric(vertical: 4),
                          child: WordWidget(
                            onTap: (){
                            },
                            wordName: controller.data[index]["wordName"],
                            wordMean: controller.data[index]["wordMean"],
                            spelling: controller.data[index]["spelling"],
                            image: controller.data[index]["image"],
                            wordType: controller.data[index]["wordType"],
                            audio: controller.data[index]["audio"],
                          ),
                        );
                      })),
            ],
          ),
        ),
      ),
    ));
  }
}
