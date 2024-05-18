import 'package:client/common/app_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class CardTopicLearned extends StatelessWidget {
   final String topicName;
   CardTopicLearned({
      super.key,
      this.topicName = 'Community In Work',});

  @override
  Widget build(BuildContext context) {
    return Container(
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
                  Text('123 words'),


                ],
              ),
            ),
          ),

        ],
      ),
    );
  }
}
