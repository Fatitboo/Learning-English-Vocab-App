import 'package:client/common/app_color.dart';
import 'package:client/view/exam/CardTopicExam.dart';
import 'package:client/view/learning_vocabulary/round_learn/round_learn_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../../res/routes/names.dart';
import '../learning_vocabulary/component/CardTopicLearned.dart';
import 'exam_controller.dart';

class ExamView extends GetView<ExamController> {
  ExamView({super.key});

  final controller = Get.put(ExamController());

  @override
  Widget build(BuildContext context) {
    Get.lazyPut<ExamController>(() => ExamController());
    return GetBuilder<ExamController>(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text(
              'KIỂM TRA TỪ VỰNG',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(Icons.close),
            ),
            surfaceTintColor: Colors.transparent,
          ),
          body: Stack(
            children: [
              Container(
                margin: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.all(20),
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
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Nguyen Van A',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xff252526)),
                              ),
                              SizedBox(
                                height: 6,
                              ),
                              // Text(
                              //   'Other infos',
                              //   style: TextStyle(
                              //       fontSize: 14,
                              //       fontWeight: FontWeight.w500,
                              //       color: Color(0xffAFAFAF)),
                              // ),
                              SizedBox(
                                height: 12,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: Color(0xffFFC800),
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  // Text(
                                  //   '260 points',
                                  //   style: TextStyle(
                                  //       fontSize: 12,
                                  //       fontWeight: FontWeight.w500,
                                  //       color: Color(0xff4D4D4F)),
                                  // ),
                                  // SizedBox(
                                  //   width: 16,
                                  // ),
                                  // Icon(
                                  //   Icons.timer,
                                  //   color: Color(0xff1CB0F6),
                                  // ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                    '260 points',
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xff4D4D4F)),
                                  ),
                                ],
                              )
                            ],
                          ),
                          CircleAvatar(
                            radius: 44, // Image radius
                            backgroundImage: NetworkImage(
                                'https://i.pinimg.com/originals/1e/c8/f4/1ec8f463568b4cfae39a71b3c1b20abc.png'),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    if (controller.lengthCheck > 0)
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            'Chọn chủ đề kiểm tra',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Color(0xff252526)),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            '${controller.lengthCheck}',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Color(0xff252526)),
                          ),
                        ],
                      ),
                    SizedBox(
                      height: 8,
                    ),
                    Container(
                      child: Expanded(
                          child: ListView.builder(
                              itemCount: controller.listTopicExam.length,
                              itemBuilder: (context, index) {
                                var item = controller.listTopicExam[index];
                                return GestureDetector(
                                  onLongPress: () {},
                                  child: Stack(children: [
                                    Container(
                                        margin:
                                            EdgeInsets.symmetric(horizontal: 1),
                                        padding:
                                            EdgeInsets.symmetric(vertical: 8),
                                        child: CardTopicExam(
                                          item: item,
                                        )),
                                    Positioned(
                                        top: 30,
                                        right: 16,
                                        child: Center(
                                            child: Checkbox(
                                          checkColor: Colors.white,
                                          activeColor: AppColors.primaryOrange,
                                          value: item['isChoose'],
                                          onChanged: (value) {
                                            print(value);
                                            controller.handleCheck(
                                                index, value ?? true);
                                          },
                                        )))
                                  ]),
                                );
                              })),
                    )
                  ],
                ),
              ),
              if (controller.listTopicExam
                      .where((element) => element['isChoose'] == true)
                      .toList()
                      .length >
                  0)
                Positioned(
                  bottom: 16,
                  left: Get.width / 2 - 130 / 2,
                  child: TextButton(
                      onPressed: () {
                        // Get.toNamed(AppRoutes.SETTING_TEST,
                        //     preventDuplicates: false);
                      },
                      style: TextButton.styleFrom(
                          backgroundColor: Color(0xff5CDDFF),
                          foregroundColor: Colors.white,
                          minimumSize: const Size(130, 45),
                          padding: const EdgeInsets.all(10),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                          side:
                              const BorderSide(width: 2, color: Colors.white)),
                      child: Text('Tiếp tục', style: TextStyle(fontSize: 16))),
                )
            ],
          ),
        );
      },
    );
  }
}
