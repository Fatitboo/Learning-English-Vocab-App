import 'package:client/res/routes/names.dart';
import 'package:client/view/exam/exam_controller.dart';
import 'package:client/view/exam/exam_round_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../common/app_color.dart';
import '../common_widget/my_button.dart';

class ResultTestPage extends StatelessWidget {
  ResultTestPage({super.key});

  final controller = Get.put(ExamRoundController());
  final controllerExam = Get.find<ExamController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ExamRoundController>(
      builder: (controller) {
        return SafeArea(
            child: Scaffold(
          backgroundColor: AppColors.rsBackground,
          appBar: AppBar(
            backgroundColor: AppColors.rsBackground,
            leading: IconButton(
              onPressed: () {
                controllerExam.reset();
                Get.back();
              },
              icon: const Icon(Icons.close),
            ),
          ),
          body: Column(
            children: [
              Container(
                height: 3,
                width: double.maxFinite,
                color: AppColors.primaryColor,
              ),
              Expanded(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SingleChildScrollView(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                flex: 3,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                     Text(
                                      controller.numTrue >= 8 ? 'Kiểm tra thành công' : 'Kiểm tra thất bại',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                     if (controller.numTrue >= 8 ) Row(
                                       crossAxisAlignment: CrossAxisAlignment.center,
                                       children: [
                                         Text(
                                           'Bạn được cộng thêm 5',
                                           textAlign: TextAlign.left,
                                           style: TextStyle(
                                               fontSize: 14,
                                               fontWeight: FontWeight.normal),
                                         ),
                                         SizedBox(width: 4,),
                                         Icon(Icons.start, color: Colors.amberAccent,)
                                       ],
                                     )
                                    else Text(
                                       'Hãy thử lại lần nữa bạn nhé',
                                       textAlign: TextAlign.left,
                                       style: TextStyle(
                                           fontSize: 14,
                                           fontWeight: FontWeight.normal),
                                     ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    const Text(
                                      'Tổng kết',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Flexible(
                                          flex: 1,
                                          child: SizedBox(
                                            height: 60,
                                            width: 60,
                                            child: SingleChildScrollView(
                                              child: CircularPercentIndicator(
                                                radius: 30,
                                                lineWidth: 5.0,
                                                animation: true,
                                                percent: controller.numTrue / 10,
                                                center: Text(
                                                  "${(controller.numTrue / 10 * 100).ceil()}%",
                                                  style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 10.0,
                                                      color: Colors.green),
                                                ),
                                                backgroundColor: Colors.red,
                                                circularStrokeCap:
                                                    CircularStrokeCap.round,
                                                progressColor: Colors.green,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Flexible(
                                          flex: 3,
                                          child: Column(
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  const Text(
                                                    'Đúng',
                                                    textAlign: TextAlign.left,
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        color: Colors.green,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                  Container(
                                                    height: 26,
                                                    width: 50,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15),
                                                        border: Border.all(
                                                            color: Colors.green,
                                                            width: 2)),
                                                    child:  Text(
                                                      '${controller.numTrue}',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          fontSize: 16,
                                                          color: Colors.green,
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    ),
                                                  )
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  const Text(
                                                    'Sai',
                                                    textAlign: TextAlign.left,
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        color: Colors.red,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                  Container(
                                                    height: 26,
                                                    width: 50,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15),
                                                        border: Border.all(
                                                            color: Colors.red,
                                                            width: 2)),
                                                    child:  Text(
                                                      '${10 - controller.numTrue}',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          fontSize: 16,
                                                          color: Colors.red,
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    ),
                                                  )
                                                ],
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),

                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          'Chi tiết',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          height: 380,
                          child: ListView.builder(
                              itemCount: controller.saveResult.length,
                              shrinkWrap: true,
                              itemBuilder: (BuildContext context, int index) {
                                var item = controller.saveResult[index];
                                return Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 6, horizontal: 10),
                                    child: Container(
                                      padding: const EdgeInsets.only(
                                        top: 13,
                                      ),
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(0),
                                          boxShadow: const [
                                            BoxShadow(
                                                color: Color(0x1f000000),
                                                blurRadius: 2,
                                                offset: Offset(0, 0.5))
                                          ]),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.symmetric(horizontal: 8),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,

                                              children: [
                                                Text("Câu ${index + 1}:", style: TextStyle(fontWeight: FontWeight.w600),),
                                                const SizedBox(
                                                  width: 12,
                                                ),
                                                 Text(
                                                  "${item['question']} ?",
                                                  overflow: TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      color: Color(0xff252526)),
                                                ),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Padding(
                                              padding: EdgeInsets.symmetric(horizontal: 8),
                                            child:  Row(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Text('Câu trả lời của bạn: '),
                                                Expanded(
                                                  child: Text(
                                                    '"${item['answer']}"',style: TextStyle(),),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(height: 8,),
                                          Container(
                                            padding: EdgeInsets.symmetric(horizontal: 8),
                                              height: 25,
                                              width: double.maxFinite,
                                              color:item['answer'] == item['correctAnswer'] ? Colors.green : Colors.red,
                                              child: (item['answer'] == item['correctAnswer']) ? Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Icon(
                                                      Icons.check,
                                                      size: 16,
                                                      color: Colors.white,
                                                    ),
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                     Text(
                                                      "Đúng. ${item['correctAnswer']}",
                                                      overflow:
                                                      TextOverflow.ellipsis,
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          fontWeight:
                                                          FontWeight.normal,
                                                          color: Colors.white),
                                                    )
                                                  ]) :
                                              Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                                  children: [
                                                    Icon(
                                                      Icons.close,
                                                      size: 16,
                                                      color: Colors.white,
                                                    ),
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    Text(
                                                      "Sai. ${item['correctAnswer']}",
                                                      overflow:
                                                      TextOverflow.ellipsis,
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          fontWeight:
                                                          FontWeight.normal,
                                                          color: Colors.white),
                                                    )
                                                  ])
                                          )
                                        ],
                                      ),
                                    ));
                              }),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
      },
    );
  }
}
