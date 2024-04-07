import 'package:client/common/app_color.dart';
import 'package:client/res/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../common_widget/my_button.dart';

class ResultRoundPage extends StatelessWidget {
  ResultRoundPage({super.key, this.learnWordNumber = 7, this.totalWord = 150});
  final int learnWordNumber;
  final int totalWord;
  List<dynamic> data = [
    {
      'wordId': "1",
      'word': "Food",
      "wordImage":
          "https://static.chotot.com/storage/chotot-kinhnghiem/c2c/2019/10/nuoi-meo-can-gi-0-1024x713.jpg",
      "wordMean": "/diSH/: Món ăn",
    },
    {
      'wordId': "2",
      'word': "Communication",
      "wordImage":
          "https://static.chotot.com/storage/chotot-kinhnghiem/c2c/2019/10/nuoi-meo-can-gi-0-1024x713.jpg",
      "wordMean": "/diSH/: Món ăn",
    },
    {
      'wordId': "3",
      'word': "Communication",
      "wordImage":
          "https://static.chotot.com/storage/chotot-kinhnghiem/c2c/2019/10/nuoi-meo-can-gi-0-1024x713.jpg",
      "wordMean": "/diSH/: Món ăn",
    },
    {
      'wordId': "4",
      'word': "Food",
      "wordImage":
          "https://static.chotot.com/storage/chotot-kinhnghiem/c2c/2019/10/nuoi-meo-can-gi-0-1024x713.jpg",
      "wordMean": "/diSH/: Món ăn",
    },
    {
      'wordId': "5",
      'word': "Communication",
      "wordImage":
          "https://static.chotot.com/storage/chotot-kinhnghiem/c2c/2019/10/nuoi-meo-can-gi-0-1024x713.jpg",
      "wordMean": "/diSH/: Món ăn",
    },
    {
      'wordId': "6",
      'word': "Communication",
      "wordImage":
          "https://static.chotot.com/storage/chotot-kinhnghiem/c2c/2019/10/nuoi-meo-can-gi-0-1024x713.jpg",
      "wordMean": "/diSH/: Món ăn",
    },
    {
      'wordId': "7",
      'word': "Food",
      "wordImage":
          "https://static.chotot.com/storage/chotot-kinhnghiem/c2c/2019/10/nuoi-meo-can-gi-0-1024x713.jpg",
      "wordMean": "/diSH/: Món ăn",
    },
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: AppColors.rsBackground,
      appBar: AppBar(
        backgroundColor: AppColors.rsBackground,
        // leading: IconButton(
        //   onPressed: () {
        //     // Get.offAndToNamed(AppRoutes.SIGN_IN);
        //   },
        //   icon: const Icon(Icons.close),
        // ),
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
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Round 1: Completed!',
                      textAlign: TextAlign.left,
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                    ),
                    const Text(
                      'Continue to the next round of topic. You can do it!',
                      textAlign: TextAlign.left,
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 20, bottom: 10),
                      child: Text(
                        'Round 1: Completed!',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.normal),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Text(
                        "$learnWordNumber/$totalWord",
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w600),
                      ),
                    ),
                    Row(
                      children: [
                        Flexible(
                          child: LinearPercentIndicator(
                            lineHeight: 8.0,
                            percent: learnWordNumber / totalWord,
                            barRadius: const Radius.circular(4),
                            padding: const EdgeInsets.only(top: 0, left: 0),
                            progressColor: AppColors.primaryColor,
                          ),
                        ),
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.only(bottom: 10, top: 20),
                      child: Text(
                        "Words of this round",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w600),
                      ),
                    ),
                    SizedBox(
                      height: 380,
                      child: ListView.builder(
                          itemCount: data.length,
                          shrinkWrap: true,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 6, horizontal: 10),
                                child: Container(
                                  padding: const EdgeInsets.all(13),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: const [
                                        BoxShadow(
                                            color: Color(0x1f000000),
                                            blurRadius: 10,
                                            offset: Offset(0, 0.5))
                                      ]),
                                  child: InkWell(
                                    onTap: () {},
                                    child: SingleChildScrollView(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Flexible(
                                            flex: 4,
                                            child: Row(
                                              children: [
                                                ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                    child: Image.network(
                                                      data[index]["wordImage"],
                                                      width: 67,
                                                      height: 67,
                                                      fit: BoxFit.cover,
                                                    )),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                Flexible(
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        data[index]["word"],
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style: const TextStyle(
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: Color(
                                                                0xff252526)),
                                                      ),
                                                      const SizedBox(
                                                        height: 5,
                                                      ),
                                                      Text(
                                                        data[index]["wordMean"],
                                                        style: const TextStyle(
                                                            fontSize: 12),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Flexible(
                                              flex: 1,
                                              child: SizedBox(
                                                height: 40,
                                                
                                                child: SingleChildScrollView(
                                                  child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                
                                                  children: [
                                                    InkWell(
                                                        onTap: () {},
                                                        child: const Icon(
                                                          Icons.volume_up,
                                                          size: 20,
                                                        )),
                                                    InkWell(
                                                        onTap: () {},
                                                        child: const Icon(
                                                          Icons.star_border,
                                                          size: 20,
                                                        ))
                                                  ],
                                                ),
                                                )
                                              ))
                                        ],
                                      ),
                                    ),
                                  ),
                                ));
                          }),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    MyButton(
                      text: 'Continue to next round',
                      onTap: () {},
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
