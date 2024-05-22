import 'package:client/common/app_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:percent_indicator/percent_indicator.dart';

class TopicDTOWidget extends StatelessWidget {
  const TopicDTOWidget({super.key,
    required this.topicName,
    required this.topicDescription,
    required this.topicImage,
    required this.onTap
  });
  final String topicName;
  final String topicDescription;
  final String topicImage;
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
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                    child: SizedBox(
                                      child: Text(topicDescription, overflow: TextOverflow.clip ,style: const TextStyle(fontSize: 12),),
                                    )
                                )
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        )
    );
  }
}