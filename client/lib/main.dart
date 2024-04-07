
import 'package:client/res/routes/names.dart';
import 'package:client/res/routes/pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:client/common_widget/bottom_navigate.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  void _onItemTapped(int index) {
    setState(() {
      switch(index){
        case 0:
          currentRoute = AppRoutes.INITIAL;
          break;
        case 1:
          currentRoute = AppRoutes.FLASH_CARD;
          break;
        case 2:
          currentRoute = AppRoutes.INITIAL;
          break;
        case 3:
          currentRoute = AppRoutes.FLASH_CARD;
          break;
      }
      _selectedIndex = index;
    });
  }
  int _selectedIndex = 0;
  String currentRoute = AppRoutes.INITIAL;

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
          initialRoute: currentRoute,
          getPages: AppPages.routes,
        )),
        // bottomNavigationBar: BottomNavigationBar(
        //   items: const <BottomNavigationBarItem>[
        //     BottomNavigationBarItem(
        //       icon: Icon(Icons.home),
        //       label: 'Trang chủ',
        //     ),
        //     BottomNavigationBarItem(
        //       icon: Icon(Icons.business),
        //       label: 'Học',
        //     ),
        //     BottomNavigationBarItem(
        //       icon: Icon(Icons.business),
        //       label: 'Kiểm tra',
        //     ),
        //     BottomNavigationBarItem(
        //       icon: Icon(Icons.person),
        //       label: 'Profile',
        //     ),
        //   ],
        //   currentIndex: _selectedIndex,
        //   selectedItemColor: Colors.amber[800],
        //   onTap: _onItemTapped,
        // )
    );
  }
}
