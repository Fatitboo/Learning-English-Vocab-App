
import 'package:client/res/routes/routes.dart';
import 'package:client/res/storage/storage.dart';
import 'package:client/res/storage/user_storage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
        apiKey: 'AIzaSyAsydYR4w1CgVT0qGNYm56Z9OklGr60Kvw',
        appId: '1:2854351837:android:34aaa8f7ad482e09b93c34',
        messagingSenderId: '2854351837',
        projectId: 'englishvoc-43d5a',
        storageBucket: 'gs://englishvoc-43d5a.appspot.com',
      )
  );
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
        initialRoute: AppRoutes.STATISCAL,
        getPages: AppPages.routes,
      )),
    );
  }
}