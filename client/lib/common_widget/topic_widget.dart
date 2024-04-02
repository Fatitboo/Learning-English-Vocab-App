import 'package:client/common/app_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:percent_indicator/percent_indicator.dart';

class TopicWidget extends StatelessWidget {
  const TopicWidget({super.key,
    required this.topicName,
    required this.topicImage,
    required this.learnNumber,
    required this.totalWords,
    required this.onTap
  });
  final String topicName;
  final String topicImage;
  final int learnNumber;
  final int totalWords;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(13),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
                color: Color(0x1f000000),
                blurRadius: 10,
                offset: Offset(0, 0.5)
            )
          ]),
      child: InkWell(
          onTap: () {
            onTap();
          },
          child: SingleChildScrollView(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Flexible(
                  flex: 4,
                  child: Row(
                    children: [
                      ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.network(topicImage, width: 67, height: 67, fit: BoxFit.cover,)
                      ),
                      const SizedBox(width: 10,),
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(topicName, overflow: TextOverflow.ellipsis, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Color(0xff252526)),),
                            const SizedBox(height: 5,),
                            Text("$learnNumber/$totalWords words", style: const TextStyle(fontSize: 12),),
                            const SizedBox(height: 5,),
                            FittedBox(
                              fit: BoxFit.fitWidth,
                              child: LinearPercentIndicator(
                                lineHeight: 3.0,
                                width: 180,
                                percent: learnNumber / totalWords,
                                barRadius: const Radius.circular(4),
                                padding: const EdgeInsets.only(top: 0, left: 0),
                                progressColor: const Color(0xff5885DD),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: SizedBox(
                    height: 40,
                    width: 40,
                    child: SingleChildScrollView(
                      child: CircularPercentIndicator(
                        radius: 20,
                        lineWidth: 3.0,
                        animation: true,
                        percent: learnNumber / totalWords,
                        center: Text(
                          "${(learnNumber / totalWords * 100).ceil()}%",
                          style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 10.0,
                              color: AppColors.primaryOrange
                          ),
                        ),
                        circularStrokeCap: CircularStrokeCap.round,
                        progressColor: AppColors.primaryOrange,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
      )
    );
  }
}