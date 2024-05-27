import 'package:client/res/routes/names.dart';
import 'package:client/view/learning_vocabulary/round_learn/round_learn_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import 'exam_controller.dart';

class ExamRoundView extends GetView<ExamController> {
  ExamRoundView({super.key});
  final controller = Get.put(ExamController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ExamController>(
      builder: (_) {
        return PopScope(
            canPop: false,
            onPopInvoked: (didPop) async {
              if (didPop) {
                return;
              }
              Get.defaultDialog(
                  radius: 8,
                  title: "Thông báo",
                  middleText: "Quá trình của bạn sẽ không được lưu",
                  textConfirm: "Thoát",
                  textCancel: "Hủy",
                  onConfirm: () {
                    Get.back();
                    controller.reset();
                    Get.back();
                  }

              );

            },
          child: Scaffold(
              appBar: AppBar(
                centerTitle: true,
                title:  Text(
                  'Kiểm Tra',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                leading: IconButton(
                  onPressed: () async {
                    Get.defaultDialog(
                        radius: 8,
                        title: "Thông báo",
                        middleText: "Quá trình của bạn sẽ không được lưu",
                        textConfirm: "Thoát",
                        textCancel: "Hủy",
                        onConfirm: () {

                          Get.back();
                           controller.reset();
                          Get.back();
                        }

                    );
                  },
                  icon: const Icon(Icons.close),
                ),
              ),
              body: Stack(
                children: [
                  Container(
                    padding: const EdgeInsets.only(bottom: 16, top: 16),
                    width: Get.width,
                    height: Get.height,
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Stack(
                            children: [
                              Container(
                                height: 10,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Color(0xffE9E8E8),
                                ),
                              ),
                              Stack(children: [
                                AnimatedContainer(
                                  height: 10,
                                  duration: Duration(milliseconds: 300), //
                                  width: (Get.width - 40) *
                                      (controller.indexQuestion + 1) /
                                      10,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Color(0xff14e901),
                                  ),
                                ),
                                Positioned(
                                  left: 10,
                                  right: 10,
                                  top: 2,
                                  child: Container(
                                    height: 4,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Color(0xffC6FFC1),
                                    ),
                                  ),
                                )
                              ]),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Expanded(
                          child: Container(
                            width: Get.width,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 32, vertical: 24),
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(12),
                                    topRight: Radius.circular(12))),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Question ${controller.indexQuestion+1}/10',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 18),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 50,
                                ),
                                Text(
                                  '${controller.question}',
                                  style: TextStyle(
                                      fontSize: 30, fontWeight: FontWeight.w300),
                                ),
                                SizedBox(
                                  height: 50,
                                ),
                                Divider(color: Color(0xffDDDDDD)),
                                SizedBox(
                                  height: 50,
                                ),
                                InkWell(
                                  onTap: () {
                                    controller.setIndexAnswer(1);
                                  },
                                  child: Container(
                                    width: Get.width,
                                    padding: EdgeInsets.symmetric(vertical: 10),
                                    child: Text(
                                      '${controller.answer1}',
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: controller.indexAnswer == 1 ?
                                             controller.colorChooseText
                                              : Color(0xff606061)),
                                      textAlign: TextAlign.center,
                                    ),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(16),
                                        color: controller.indexAnswer == 1
                                            ? controller.colorChoose
                                            : Colors.transparent,
                                        border: Border(
                                          top: BorderSide(
                                              width: 1,
                                              color: controller.indexAnswer == 1
                                                  ? controller.colorChooseBorder
                                                  : Color(0xffCCCCCC)),
                                          left: BorderSide(
                                              width: 1,
                                              color: controller.indexAnswer == 1
                                                  ? controller.colorChooseBorder
                                                  : Color(0xffCCCCCC)),
                                          right: BorderSide(
                                              width: 1,
                                              color: controller.indexAnswer == 1
                                                  ? controller.colorChooseBorder
                                                  : Color(0xffCCCCCC)),
                                          bottom: BorderSide(
                                              width: 3,
                                              color: controller.indexAnswer == 1
                                                  ? controller.colorChooseBorder
                                                  : Color(0xffCCCCCC)),
                                        )),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                InkWell(
                                  onTap: () {
                                    controller.setIndexAnswer(2);
                                  },
                                  child: Container(
                                    width: Get.width,
                                    padding: EdgeInsets.symmetric(vertical: 10),
                                    child: Text(
                                      '${controller.answer2}',
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: controller.indexAnswer == 2
                                              ? controller.colorChooseText
                                              : Color(0xff606061)),
                                      textAlign: TextAlign.center,
                                    ),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(16),
                                        color: controller.indexAnswer == 2
                                            ? controller.colorChoose
                                            : Colors.transparent,
                                        border: Border(
                                          top: BorderSide(
                                              width: 1,
                                              color: controller.indexAnswer == 2
                                                  ? controller.colorChooseBorder
                                                  : Color(0xffCCCCCC)),
                                          left: BorderSide(
                                              width: 1,
                                              color: controller.indexAnswer == 2
                                                  ? controller.colorChooseBorder
                                                  : Color(0xffCCCCCC)),
                                          right: BorderSide(
                                              width: 1,
                                              color: controller.indexAnswer == 2
                                                  ? controller.colorChooseBorder
                                                  : Color(0xffCCCCCC)),
                                          bottom: BorderSide(
                                              width: 3,
                                              color: controller.indexAnswer == 2
                                                  ? controller.colorChooseBorder
                                                  : Color(0xffCCCCCC)),
                                        )),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                InkWell(
                                  onTap: () {
                                    controller.setIndexAnswer(3);
                                  },
                                  child: Container(
                                    width: Get.width,
                                    padding: EdgeInsets.symmetric(vertical: 10),
                                    child: Text(
                                      '${controller.answer3}',
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: controller.indexAnswer == 3
                                              ? controller.colorChooseText
                                              : Color(0xff606061)),
                                      textAlign: TextAlign.center,
                                    ),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(16),
                                        color: controller.indexAnswer == 3
                                            ? controller.colorChoose
                                            : Colors.transparent,
                                        border: Border(
                                          top: BorderSide(
                                              width: 1,
                                              color: controller.indexAnswer == 3
                                                  ? controller.colorChooseBorder
                                                  : Color(0xffCCCCCC)),
                                          left: BorderSide(
                                              width: 1,
                                              color: controller.indexAnswer == 3
                                                  ? controller.colorChooseBorder
                                                  : Color(0xffCCCCCC)),
                                          right: BorderSide(
                                              width: 1,
                                              color: controller.indexAnswer == 3
                                                  ? controller.colorChooseBorder
                                                  : Color(0xffCCCCCC)),
                                          bottom: BorderSide(
                                              width: 3,
                                              color: controller.indexAnswer == 3
                                                  ? controller.colorChooseBorder
                                                  : Color(0xffCCCCCC)),
                                        )),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                InkWell(
                                  onTap: () {
                                    controller.setIndexAnswer(4);
                                  },
                                  child: Container(
                                    width: Get.width,
                                    padding: EdgeInsets.symmetric(vertical: 10),
                                    child: Text(
                                      '${controller.answer4}',
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: controller.indexAnswer == 4
                                              ? controller.colorChooseText
                                              : Color(0xff606061)),
                                      textAlign: TextAlign.center,
                                    ),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(16),
                                        color: controller.indexAnswer == 4
                                            ? controller.colorChoose
                                            : Colors.transparent,
                                        border: Border(
                                          top: BorderSide(
                                              width: 1,
                                              color: controller.indexAnswer == 4
                                                  ? controller.colorChooseBorder
                                                  : Color(0xffCCCCCC)),
                                          left: BorderSide(
                                              width: 1,
                                              color: controller.indexAnswer == 4
                                                  ? controller.colorChooseBorder
                                                  : Color(0xffCCCCCC)),
                                          right: BorderSide(
                                              width: 1,
                                              color: controller.indexAnswer == 4
                                                  ? controller.colorChooseBorder
                                                  : Color(0xffCCCCCC)),
                                          bottom: BorderSide(
                                              width: 3,
                                              color: controller.indexAnswer == 4
                                                  ? controller.colorChooseBorder
                                                  : Color(0xffCCCCCC)),
                                        )),
                                  ),
                                ),

                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  if (controller.indexAnswer!=0 ) Positioned(
                      bottom: 0,
                      child: Container(
                        width: Get.width,
                        height: 150,
                        padding: EdgeInsets.all(24),
                        color: Color(0xffd3eefb),
                        alignment: Alignment.center,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color(0xff1cb0f6),
                                  ),
                                  child: Center(
                                    child: Icon(Icons.question_mark, color: Colors.white,),
                                  ),
                                ),
                                SizedBox(width: 12,),
                                Text('Bạn chắc chứ?', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20, color: Color(0xff1CB0F6)),)
                              ],
                            ),
                            SizedBox(height: 12,),
                            InkWell(
                              onTap: () {
                                controller.nextQuestion();
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(vertical: 8),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(28),
                                    color: const Color(0xff1CB0F6),
                                    border: const Border(
                                        bottom: BorderSide(
                                            width: 4,
                                            color: Color(0xff0980B8)
                                        ),

                                        left: BorderSide(
                                            width: 1,
                                            color: Color(0xff0980B8)
                                        ),
                                        right: BorderSide(
                                            width: 1,
                                            color: Color(0xff0980B8)
                                        )
                                    )
                                ),
                                child: Center(
                                  child: Text('TIẾP TỤC', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20, color: Colors.white),),
                                ),
                              ),
                            )
                          ],
                        ),
                      )),

                ],
              )),
        );
      },
    );
  }
}
