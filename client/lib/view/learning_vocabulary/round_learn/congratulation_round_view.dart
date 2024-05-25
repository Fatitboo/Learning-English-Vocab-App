import 'package:client/common/app_color.dart';
import 'package:client/res/routes/names.dart';
import 'package:client/view/learning_vocabulary/round_learn/round_learn_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class CongratulationView extends StatelessWidget {
   CongratulationView({super.key});
   final controller = Get.find<RoundLearnController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title:  Text(
            'Vòng ${controller.nextRound}',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),

        ),
        body: Container(
          width: Get.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 40,),
              Text('Congratulation!', style: TextStyle(color: Color(0xff007398), fontWeight: FontWeight.w700, fontSize: 28),),
              SizedBox(height: 8,),
              Text('Bạn vừa hoàn thành vòng ${controller.nextRound}', style: TextStyle(fontSize: 16, color: Color(0xff429EBB)),),
              SizedBox(height: 80,),
              Image.asset('assets/images/congratulation.png'),
              SizedBox(height: 32,),
              CircularPercentIndicator(
                radius: 36,
                lineWidth: 6,
                animation: false,
                percent: controller.nextRound  / controller.numberOfRounds,
                center:  Text(
                  '${controller.nextRound}/${controller.numberOfRounds}',
                  style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                      color: AppColors.primaryOrange
                  ),
                ),
                circularStrokeCap: CircularStrokeCap.round,
                progressColor: AppColors.primaryOrange,
              ),
              SizedBox(height: 32,),
              InkWell(
                onTap: () {
                  Get.offNamed(AppRoutes.LEARNING_VOCABULARY);
                },
                child: Container(
                  width: 200,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Color(0xff5CDDFF),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Text('Tiếp tục', style: TextStyle(fontWeight: FontWeight.w600, color: Colors.white, fontSize: 18),),
                  ),
                ),
              )
            ],
          ),
        )
    );
    }

}