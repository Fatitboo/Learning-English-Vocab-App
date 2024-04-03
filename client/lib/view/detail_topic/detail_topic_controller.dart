import 'package:get/get.dart';
class DetailTopicController extends GetxController{
  Rx<String> topicName = "".obs;
  Rx<String> topicId = "".obs;

  List<dynamic> data = [].obs;

  @override
  void onInit() {
    super.onInit();

    var args = Get.arguments;

    topicName.value = args['topicName'];
    topicId.value = args['topicId'];
    callApi(topicId.value);

  }

  void callApi (String topicId) {
    if(topicId.isNotEmpty){
      // call api

      data = [
        {
          "wordName": "Food",
          "wordMean": "Món ăn",
          "spelling": "/fu:d/",
          "image": "https://upload.wikimedia.org/wikipedia/commons/thumb/6/6d/Good_Food_Display_-_NCI_Visuals_Online.jpg/800px-Good_Food_Display_-_NCI_Visuals_Online.jpg",
          "wordType": "(n)",
          "audio": "https://stream-dict-laban.zdn.vn/uk/97769b5056b5d2a35ac4c7aa3086c12e/18ea4c125bb/F/food.mp3"
        },
        {
          "wordName": "Delicious",
          "wordMean": "Ngon lành",
          "spelling": "/di'li∫əs/",
          "image": "https://learnitaliango.com/wp-content/uploads/2021/07/delicious-in-Italian.jpg",
          "wordType": "(adj)",
          "audio": "https://stream-dict-laban.zdn.vn/uk/2739cd3b362b249baa176482439ff133/18ea4c2f36d/D/delicious.mp3"
        },
        {
          "wordName": "Fantastic",
          "wordMean": "Kỳ quái",
          "spelling": "/fæn'tæstik/",
          "image": "https://media.istockphoto.com/id/1132010479/vector/wow-comic-sound-effect-speech-balloon.jpg?s=612x612&w=0&k=20&c=Tnvhbu-rPLf3q3_naS9RhPfLKF91KppHP1M5kqQivXs=",
          "wordType": "(adj)",
          "audio": "https://stream-dict-laban.zdn.vn/us/66230c994162f527b41afd50ec59f5d8/18ea4ca1a70/F/fantastic.mp3"
        },
      ];
    }
  }
}