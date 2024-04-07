import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../common/app_color.dart';
import '../common_widget/my_button.dart';

class ResultTestPage extends StatefulWidget {
  const ResultTestPage({super.key});

  @override
  State<ResultTestPage> createState() => _ResultTestPageState();
}

class _ResultTestPageState extends State<ResultTestPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: AppColors.rsBackground,
      appBar: AppBar(
        backgroundColor: AppColors.rsBackground,
        // leading: IconButton(
        //   onPressed: () {},
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
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
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
                                const Text(
                                  'Result of this test',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w500),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Text(
                                  'Topic: Food',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Text(
                                  'Your result',
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
                                            percent: 15 / 20,
                                            center: Text(
                                              "${(15 / 20 * 100).ceil()}%",
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.w500,
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
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              const Text(
                                                'True',
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
                                                        BorderRadius.circular(
                                                            15),
                                                    border: Border.all(
                                                        color: Colors.green,
                                                        width: 2)),
                                                child: const Text(
                                                  '15',
                                                  textAlign: TextAlign.center,
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
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              const Text(
                                                'False',
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
                                                        BorderRadius.circular(
                                                            15),
                                                    border: Border.all(
                                                        color: Colors.red,
                                                        width: 2)),
                                                child: const Text(
                                                  '5',
                                                  textAlign: TextAlign.center,
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
                    MyButton(
                      text: 'Doing the new test',
                      onTap: () {},
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'Your answer',
                      textAlign: TextAlign.left,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 380,
                      child: ListView.builder(
                          itemCount: 5,
                          shrinkWrap: true,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 6, horizontal: 10),
                                child: Container(
                                  padding: const EdgeInsets.only(
                                    top: 13,
                                  ),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(0),
                                      boxShadow: const [
                                        BoxShadow(
                                            color: Color(0x1f000000),
                                            blurRadius: 2,
                                            offset: Offset(0, 0.5))
                                      ]),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(2),
                                              child: Image.network(
                                                "https://static.chotot.com/storage/chotot-kinhnghiem/c2c/2019/10/nuoi-meo-can-gi-0-1024x713.jpg",
                                                width: 67,
                                                height: 67,
                                                fit: BoxFit.cover,
                                              )),
                                          const SizedBox(
                                            width: 20,
                                          ),
                                          const Text(
                                            "Mon an",
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.normal,
                                                color: Color(0xff252526)),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      const Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.check,
                                            color: Colors.green,
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            "Mon an",
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.normal,
                                                color: Colors.green),
                                          ),
                                        ],
                                      ),
                                      Container(
                                          height: 25,
                                          width: double.maxFinite,
                                          color: Colors.green,
                                          child: const Row(
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
                                                  "True",
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      color: Colors.white),
                                                )
                                              ]))
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
  }
}
