import 'package:client/common_widget/topic_widget.dart';
import 'package:client/res/routes/routes.dart';
import 'package:client/view/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class HomePage extends GetView<HomeController> {
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: Container(
            margin: const EdgeInsets.all(24),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  const Text("Hi, Nhan Le", style: TextStyle(fontSize: 34, fontWeight: FontWeight.w500,)),
                  const Text("What do you want to learn today?", style: TextStyle(fontWeight: FontWeight.w300, fontSize: 14),),
                  Container(
                    color: const Color.fromARGB(255, 213, 213, 213 ),
                    margin: const EdgeInsets.only(top: 5, bottom: 10),
                    height: 1,
                  ),
                  SingleChildScrollView(
                    child: SizedBox(
                      height: 500,
                      child: ListView.builder(
                          itemCount: controller.data.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: TopicWidget(
                                  topicName: controller.data[index]["topicName"],
                                  topicImage: controller.data[index]["topicImage"],
                                  learnNumber: controller.data[index]["learnNumber"],
                                  totalWords: controller.data[index]["totalWords"],
                                  onTap: (){
                                    controller.toDetailTopicPage(controller.data[index]["topicId"], controller.data[index]["topicName"]);
                                    print("concec");
                                  }
                              ),
                            );
                          }
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      ElevatedButton(onPressed: (){
                        Get.toNamed(AppRoutes.FLASH_CARD);
                      }, child: Text("to flc")),
                      ElevatedButton(onPressed: (){
                        Get.toNamed(AppRoutes.PRIVATE_INFO_MANAGER);
                      }, child: Text("to qltt")),
                      ElevatedButton(onPressed: (){
                        Get.toNamed(AppRoutes.STATISCAL);
                      }, child: Text("to tk")),

                    ],
                  ),
                  Row(
                    children: [

                      ElevatedButton(onPressed: (){
                        Get.toNamed(AppRoutes.RESULT_ROUND);
                      }, child: Text("to rsr")),
                      ElevatedButton(onPressed: (){
                        Get.toNamed(AppRoutes.RESULT_TEST);
                      }, child: Text("to rst")),
                      ElevatedButton(onPressed: (){
                        Get.toNamed(AppRoutes.SETTING_TEST);
                      }, child: Text("to stt")),
                    ],
                  )
                ],
              ),
            ),
          ),
        )
    );
  }
}

