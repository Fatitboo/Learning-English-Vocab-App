import 'package:client/common/app_color.dart';
import 'package:client/common_widget/topic_widget.dart';
import 'package:client/view/home/home_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class HomePage extends GetView<HomeController> {
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    return SafeArea(
        child: Scaffold(
          body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: const EdgeInsets.all(14),
                  decoration: const BoxDecoration(
                      color: AppColors.secondaryColor,
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(12.0), bottomRight: Radius.circular(12.0)),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Vocaber", style: TextStyle(fontSize: 32, fontWeight: FontWeight.w500, color: Colors.white)),
                          Icon(
                            Icons.notifications_none_rounded,
                            color: Colors.white,
                            size: 28.0,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Container(
                              decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.all(Radius.circular(30)),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Color(0x1f000000),
                                        blurRadius: 12,
                                        offset: Offset(0, 4)
                                    )
                                  ]
                              ),
                              padding: const EdgeInsets.all(13),
                              margin: const EdgeInsets.symmetric(vertical: 10),
                              child: const Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Icon(
                                    Icons.search,
                                    color: Colors.black45,
                                    size: 26.0,
                                  ),
                                  SizedBox(width: 10,),
                                  Text("What topic you want to learn?", style: TextStyle(fontSize: 14),),
                                ],
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
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
                )
              ],
            ),
          ),
        )
    );
  }
}

