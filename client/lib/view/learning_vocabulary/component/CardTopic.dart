import 'package:client/common/app_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class CardTopic extends StatelessWidget {
   final String topicName;
   final int currentWords;
   final int totalWords;
    CardTopic({
      super.key,
      this.topicName = 'Community In Work',
      this.currentWords = 1,
      this.totalWords = 2});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(1),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow:
        [
          BoxShadow(
            color: Color(0xff000000).withOpacity(0.2),
            offset: Offset(0,0),
            blurRadius: 4,

          )
        ]
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset('assets/images/topic.png',width: 60, height: 60, fit: BoxFit.cover,),
          ),
          Expanded(
            flex: 1,
            child: Container(
              padding: const EdgeInsets.only(left: 16, right: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(topicName, style:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Color(0xff252526)),),
                  SizedBox(height: 4,),
                  Text('${currentWords.toString()}/${totalWords.toString()} words', style: TextStyle(fontSize: 14),),
                  SizedBox(height: 6,),
                  SizedBox(
                    width: Get.width * 0.7,
                    child: LinearProgressIndicator(
                      value: currentWords * 1.0 / totalWords,
                      backgroundColor: const Color(0xffd9d9d9),
                      valueColor: const AlwaysStoppedAnimation<Color>(Color(0xff5885DD)),
                      borderRadius: BorderRadius.circular(5),
                    ),
                  )

                ],
              ),
            ),
          ),

          CircularPercentIndicator(
            radius: 22,
            lineWidth: 4,
            animation: true,
            percent: currentWords  / totalWords,
            center: const Text(
              "5/7",
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                  color: AppColors.primaryOrange
              ),
            ),
            circularStrokeCap: CircularStrokeCap.round,
            progressColor: AppColors.primaryOrange,
          ),



        ],
      ),
    );
  }
}
