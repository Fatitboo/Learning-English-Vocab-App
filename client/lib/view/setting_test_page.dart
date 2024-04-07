import 'package:client/common/app_color.dart';
import 'package:client/common_widget/my_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

class SettingTestPage extends StatefulWidget {
  const SettingTestPage({super.key});

  @override
  State<SettingTestPage> createState() => _SettingTestPageState();
}

class _SettingTestPageState extends State<SettingTestPage> {
  int _currentHorizontalIntValue = 20;
  bool _isShowAnswer = false;
  bool _isTrueOrFalse = false;
  bool _isManyOptions = false;
  bool _isEssay = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: AppColors.rsBackground,
      appBar: AppBar(
        backgroundColor: AppColors.rsBackground,
        leading: IconButton(
          onPressed: () {},
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
                          const Flexible(
                            flex: 3,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Topic: Food',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.normal),
                                ),
                                Text(
                                  'Setting the test',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ),
                          Flexible(
                            flex: 1,
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.asset(
                                  'assets/images/test.png',
                                  width: 90,
                                  height: 120,
                                  fit: BoxFit.cover,
                                )),
                          )
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Number of questions',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w600),
                        ),
                        NumberPicker(
                          value: _currentHorizontalIntValue,
                          minValue: 10,
                          maxValue: 40,
                          step: 5,
                          itemHeight: 30,
                          axis: Axis.horizontal,
                          onChanged: (value) => setState(
                              () => _currentHorizontalIntValue = value),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: Colors.black26),
                          ),
                          textStyle: const TextStyle(fontSize: 12),
                          selectedTextStyle: const TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w600),
                          itemWidth: 40,
                        ),
                      ],
                    ),
                    const SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Show the answer immediately',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w600),
                        ),
                        CupertinoSwitch(
                          value: _isShowAnswer,
                          onChanged: (value) {
                            setState(() {
                              _isShowAnswer = !_isShowAnswer;
                            });
                          },
                          activeColor: AppColors.primaryColor,
                        ),
                      ],
                    ),
                    const SizedBox(height: 20,),
                    const Text(
                      'Answer with',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: 14, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 5,),
                    const Text(
                      'Words and definitions',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: 13, fontWeight: FontWeight.normal),
                    ),
                    const SizedBox(height: 20,),
                    Container(
                      height: 2,
                      color: Colors.grey.shade300,
                    ),
                    const SizedBox(height: 20,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'True/False',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w600),
                        ),
                        CupertinoSwitch(
                          value: _isTrueOrFalse,
                          onChanged: (value) {
                            setState(() {
                              _isTrueOrFalse = !_isTrueOrFalse;
                            });
                          },
                          activeColor: AppColors.primaryColor,
                        ),
                      ],
                    ),
                    const SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Many options',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w600),
                        ),
                        CupertinoSwitch(
                          value: _isManyOptions,
                          onChanged: (value) {
                            setState(() {
                              _isManyOptions = !_isManyOptions;
                            });
                          },
                          activeColor: AppColors.primaryColor,
                        ),
                      ],
                    ),
                    const SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Essay',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w600),
                        ),
                        CupertinoSwitch(
                          value: _isEssay,
                          onChanged: (value) {
                            setState(() {
                              _isEssay = !_isEssay;
                            });
                          },
                          activeColor: AppColors.primaryColor,
                        ),
                      ],
                    ),
                    const SizedBox(height: 150,),
                    MyButton(
                      text: 'Start taking the test',
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
