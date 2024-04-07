
import 'package:client/common/app_color.dart';
import 'package:client/res/routes/pages.dart';
import 'package:client/res/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: ((context, child)=> GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            fontFamily: "Poppins",
        ),
        title: 'EngVocab',
        initialRoute: AppRoutes.DETAIL_LEARNED_TOPIC_WORD,
        getPages: AppPages.routes,
      )),
    );
  }
}
