import 'package:client/common/app_color.dart';
import 'package:client/common_widget/achive_cell.dart';
import 'package:client/view/statiscal/statiscal_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common_widget/rankingRow.dart';

class StatiscalView extends StatelessWidget {
  final controller = Get.put(StatiscalController());
  List latestArr = [
    {
      "image": "assets/icons/google.png",
      "title": "Nguyen Van A",
      "time": "Score: 200pt"
    },
    {
      "image": "assets/images/test.png",
      "title": "Nguyen Van B",
      "time": "Score: 100pt"
    },
    {
      "image": "assets/images/img.png",
      "title": "Nguyen Van A",
      "time": "Score: 200pt"
    },
    {
      "image": "assets/images/learn.png",
      "title": "Nguyen Van B",
      "time": "Score: 100pt"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return GetBuilder<StatiscalController>(builder: (_) {
      return Scaffold(
        backgroundColor: AppColors.rsBackground,
        body: Container(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "LearningE",
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                    ),
                    Icon(Icons.notifications_none_outlined)
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Your progress",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 220,
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Your knowledge",
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Expanded(
                            child: AchiveCell(
                              icon: "assets/images/learn.png",
                              value: "${controller.totalWordLearned} words",
                              title: "Total word you learned ",
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: AchiveCell(
                                  icon: "assets/images/learn.png",
                                  value: "${controller.totalTopicCompleted} topics",
                                  title: "Completed",
                                ),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Expanded(
                                child: AchiveCell(
                                  icon: "assets/images/test.png",
                                  value: "${controller.totalInProcessTopicsCount} topics",
                                  title: "InProcess",
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        colors: [AppColors.primaryColor, AppColors.lightPColor]),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                      topRight: Radius.circular(70),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  "Your score",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                RankingRow(wObj: {"avatar": controller.avatarPath, "fullname": controller.fullname, "score": controller.score}),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  "Ranking list",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 8,
                ),
                Expanded(

                  child: Container(
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Color(0x1f000000),
                              blurRadius: 10,
                              offset: Offset(0, 0.5)
                          )
                        ],
                        borderRadius: BorderRadius.all(Radius.circular(10))
                    ),
                    width: MediaQuery.of(context).size.width,

                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: ListView.builder(
                          padding: EdgeInsets.zero,
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: controller.allUsers.length,
                          itemBuilder: (context, index) {
                            var item = {
                              "avatar": controller.allUsers[index].avatar,
                              "fullname": controller.allUsers[index].fullname,
                              "score": controller.allUsers[index].score
                            };
                            var wObj = item as Map? ?? {};
                            return RankingRow(wObj: wObj);
                          }),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }
  );
  }
}
