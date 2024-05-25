
import 'package:client/res/routes/routes.dart';
import 'package:client/res/storage/storage.dart';
import 'package:client/res/storage/user_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Get.putAsync<StorageService>(() => StorageService().init());
  Get.put<UserStore>(UserStore());
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
            fontFamily: "Poppins"
        ),
        title: 'EngVocab',
        initialRoute: AppRoutes.EXAM,
        getPages: AppPages.routes,
      )),
    );
  }
}