import 'package:get/get.dart';

import '../../res/routes/names.dart';
class HomeController extends GetxController{
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
      'topicId': "3",
      'topicName': "Communication Communication",
      "topicImage": "https://static.chotot.com/storage/chotot-kinhnghiem/c2c/2019/10/nuoi-meo-can-gi-0-1024x713.jpg",
      "learnNumber": 120,
      "totalWords": 200,
      "onTap": (){
        print("hello");
      }
    },
    {
      'topicId': "4",
      'topicName': "Communication Communication",
      "topicImage": "https://static.chotot.com/storage/chotot-kinhnghiem/c2c/2019/10/nuoi-meo-can-gi-0-1024x713.jpg",
      "learnNumber": 120,
      "totalWords": 200,
      "onTap": (){
        print("hello");
      }
    },
    {
      'topicId': "5",
      'topicName': "Communication Communication",
      "topicImage": "https://static.chotot.com/storage/chotot-kinhnghiem/c2c/2019/10/nuoi-meo-can-gi-0-1024x713.jpg",
      "learnNumber": 120,
      "totalWords": 200,
      "onTap": (){
        print("hello");
      }
    },
    {
      'topicId': "6",
      'topicName': "Communication Communication",
      "topicImage": "https://static.chotot.com/storage/chotot-kinhnghiem/c2c/2019/10/nuoi-meo-can-gi-0-1024x713.jpg",
      "learnNumber": 120,
      "totalWords": 200,
      "onTap": (){
        print("hello");
      }
    },
    {
      'topicId': "7",
      'topicName': "Communication Communication",
      "topicImage": "https://static.chotot.com/storage/chotot-kinhnghiem/c2c/2019/10/nuoi-meo-can-gi-0-1024x713.jpg",
      "learnNumber": 120,
      "totalWords": 200,
      "onTap": (){
        print("hello");
      }
    },
  ] ;
  void toDetailTopicPage(String topicId, String topicName) {
    Get.toNamed(AppRoutes.DETAIL_TOPIC, arguments:{
        "topicId": topicId,
        "topicName": topicName
      },
      preventDuplicates: false
    );

  }
}