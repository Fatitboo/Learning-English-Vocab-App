import 'package:client/common/app_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class CardTopic extends StatelessWidget {
  var item;
  int currentRound;
  int numberOfRounds;
  int indexBlock;
  int index;
    CardTopic({
      super.key,
      this.item,

    required this.currentRound,
    required this.numberOfRounds,
      required this.index,
      required this.indexBlock,
    });

  @override
  Widget build(BuildContext context) {

    return Stack(
      children: [
        Container(
          margin: EdgeInsets.all(1),
          padding: EdgeInsets.all(16),
          decoration: index < indexBlock ? BoxDecoration(
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
          ) : BoxDecoration(

          ),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(item['topicImage'],width: 60, height: 60, fit: BoxFit.cover,),
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
                      Text(item['topicName'], style:
                      const TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Color(0xff252526)),),
                      SizedBox(height: 4,),
                      Text('${item['learntWords'].toString()}/${item['totalWords'].toString()} words', style: TextStyle(fontSize: 14),),
                      SizedBox(height: 6,),
                      SizedBox(
                        width: Get.width * 0.7,
                        child: LinearProgressIndicator(
                          value: item['learntWords'] * 1.0 / item['totalWords'],
                          backgroundColor: const Color(0xffd9d9d9),
                          valueColor: const AlwaysStoppedAnimation<Color>(Color(0xff5885DD)),
                          borderRadius: BorderRadius.circular(5),
                        ),
                      )

                    ],
                  ),
                ),
              ),

              if (currentRound < numberOfRounds) CircularPercentIndicator(
                radius: 22,
                lineWidth: 4,
                animation: true,
                percent: item['learntWords']  / item['totalWords'],
                center:  Text(
                  '${currentRound}/${numberOfRounds}',
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                      color: AppColors.primaryOrange
                  ),
                ),
                circularStrokeCap: CircularStrokeCap.round,
                progressColor: AppColors.primaryOrange,
              )
              else Column(children: [
                Icon(Icons.check, color: AppColors.primaryOrange,),
                Text('Đã học', style: TextStyle(color: AppColors.primaryOrange),)
              ],),



            ],
          ),
        ),
        if (index >= indexBlock) Positioned(
            top: 0,
            left: 0,
            bottom: 0,
            right: 0,
            child: Container(

              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.black.withOpacity(0.1),
              ),
            )
        )
      ],
    );
  }
}
