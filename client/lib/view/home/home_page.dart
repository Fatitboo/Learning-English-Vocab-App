import 'package:client/common_widget/topic_widget.dart';
import 'package:client/view/home/home_controller.dart';
import 'package:client/view/login/login_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends GetView<HomeController> {
  HomePage({super.key});
  List<dynamic> data = [
    {
      'topicId': "1",
      'topicName': "Communication Communication",
      "topicImage": "https://static.chotot.com/storage/chotot-kinhnghiem/c2c/2019/10/nuoi-meo-can-gi-0-1024x713.jpg",
      "learnNumber": 120,
      "totalWords": 200,
      "onTap": (){
        print("hello");
      }
    },
    {
      'topicId': "2",
      'topicName': "Flight",
      "topicImage": "https://static.chotot.com/storage/chotot-kinhnghiem/c2c/2019/10/nuoi-meo-can-gi-0-1024x713.jpg",
      "learnNumber": 50,
      "totalWords": 210,
      "onTap": (){
        print("hello");
      }
    },
    {
      'topicId': "1",
      'topicName': "Communication Communication",
      "topicImage": "https://static.chotot.com/storage/chotot-kinhnghiem/c2c/2019/10/nuoi-meo-can-gi-0-1024x713.jpg",
      "learnNumber": 120,
      "totalWords": 200,
      "onTap": (){
        print("hello");
      }
    },
    {
      'topicId': "1",
      'topicName': "Communication Communication",
      "topicImage": "https://static.chotot.com/storage/chotot-kinhnghiem/c2c/2019/10/nuoi-meo-can-gi-0-1024x713.jpg",
      "learnNumber": 120,
      "totalWords": 200,
      "onTap": (){
        print("hello");
      }
    },
    {
      'topicId': "1",
      'topicName': "Communication Communication",
      "topicImage": "https://static.chotot.com/storage/chotot-kinhnghiem/c2c/2019/10/nuoi-meo-can-gi-0-1024x713.jpg",
      "learnNumber": 120,
      "totalWords": 200,
      "onTap": (){
        print("hello");
      }
    },
    {
      'topicId': "1",
      'topicName': "Communication Communication",
      "topicImage": "https://static.chotot.com/storage/chotot-kinhnghiem/c2c/2019/10/nuoi-meo-can-gi-0-1024x713.jpg",
      "learnNumber": 120,
      "totalWords": 200,
      "onTap": (){
        print("hello");
      }
    },
    {
      'topicId': "1",
      'topicName': "Communication Communication",
      "topicImage": "https://static.chotot.com/storage/chotot-kinhnghiem/c2c/2019/10/nuoi-meo-can-gi-0-1024x713.jpg",
      "learnNumber": 120,
      "totalWords": 200,
      "onTap": (){
        print("hello");
      }
    },
  ] ;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          margin: const EdgeInsets.all(24),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                const Text("Hi, Nhan Le", style: TextStyle(fontSize: 34, fontWeight: FontWeight.w500,)),
                const Text("What do you want to learn today?", style: TextStyle(fontWeight: FontWeight.w300, fontSize: 14),),
                Container(
                  color: const Color.fromARGB(255, 213, 213, 213 ),
                  margin: const EdgeInsets.only(top: 5, bottom: 10),
                  height: 1,
                ),
                Expanded(
                  child: SizedBox(
                    height: 500,
                    child: ListView.builder(
                        itemCount: data.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: TopicWidget(
                                topicName: data[index]["topicName"],
                                topicImage: data[index]["topicImage"],
                                learnNumber: data[index]["learnNumber"],
                                totalWords: data[index]["totalWords"],
                                onTap: (){
                                  print("hello");
                                }
                            ),
                          );
                        }
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      )
    );
  }
}

