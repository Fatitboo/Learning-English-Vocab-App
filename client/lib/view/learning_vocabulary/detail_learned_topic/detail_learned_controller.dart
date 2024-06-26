
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';
import 'package:http/http.dart' as http;

import '../../../res/data/network_api_service.dart';
import '../../../res/model/topic_learn_dto.dart';


class DetailLearnedController extends GetxController {
  DetailLearnedController();
  int topicId = 0;
  String topicImage = '';
  List<WordDTO> listWordsLearnByTopic = [];
  List<WordDTO> listWordsLearnByTopicOrigin = [];
  final NetworkApiService networkApiService = NetworkApiService();
  TextEditingController search = TextEditingController();


  @override
  void onInit() {
    super.onInit();
    var args = Get.arguments;
    topicId = args['topicId'];
    topicImage = args['topicImage'];
    getWordsLeanByTopic(topicId);

  }
  Future<void>  getWordsLeanByTopic(topicId) async {
    http.Response res = await networkApiService.getApi("/learnt/getWordsByTopic/$topicId");

    if(res.statusCode == HttpStatus.ok){
      Iterable i = json.decode(utf8.decode(res.bodyBytes));
      listWordsLearnByTopic =  List<WordDTO>.from(i.map((model)=> WordDTO.fromJson(model))).toList();
      listWordsLearnByTopicOrigin = List.from(listWordsLearnByTopic);
      update();
    }
    else{
      Map<String, dynamic> resMessage = json.decode(utf8.decode(res.bodyBytes));
      print(resMessage["message"]);
    }
  }
  void handleChange(String search) {
    if (search.trim()=='') listWordsLearnByTopic = List.from(listWordsLearnByTopicOrigin);
    listWordsLearnByTopic = listWordsLearnByTopicOrigin.where((element) => element.wordName.toString().toLowerCase().contains(search.toLowerCase())).toList();
    update();
  }
  final _data = [
    {
      "wordName": "Food",
      "wordMean": "Món ăn",
      "spelling": "/fu:d/",
      "image": "https://upload.wikimedia.org/wikipedia/commons/thumb/6/6d/Good_Food_Display_-_NCI_Visuals_Online.jpg/800px-Good_Food_Display_-_NCI_Visuals_Online.jpg",
      "wordType": "n",
      "audio": "https://stream-dict-laban.zdn.vn/uk/97769b5056b5d2a35ac4c7aa3086c12e/18ea4c125bb/F/food.mp3"
    },
    {
      "wordName": "Delicious",
      "wordMean": "Ngon lành",
      "spelling": "/di'li∫əs/",
      "image": "https://learnitaliango.com/wp-content/uploads/2021/07/delicious-in-Italian.jpg",
      "wordType": "adj",
      "audio": "https://stream-dict-laban.zdn.vn/uk/2739cd3b362b249baa176482439ff133/18ea4c2f36d/D/delicious.mp3"
    },
    {
      "wordName": "Fantastic",
      "wordMean": "Kỳ quái",
      "spelling": "/fæn'tæstik/",
      "image": "https://media.istockphoto.com/id/1132010479/vector/wow-comic-sound-effect-speech-balloon.jpg?s=612x612&w=0&k=20&c=Tnvhbu-rPLf3q3_naS9RhPfLKF91KppHP1M5kqQivXs=",
      "wordType": "adj",
      "audio": "https://stream-dict-laban.zdn.vn/us/66230c994162f527b41afd50ec59f5d8/18ea4ca1a70/F/fantastic.mp3"
    },
    {
      "wordName": "Beefburger",
      "wordMean": "Hamber",
      "spelling": "/'bi:fbɜ:gə[r]/",
      "image": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRyClsjlSyQ5zAn4ntOwaqljC2mxwXSCrJ_Q86wq1u7Hg&s",
      "wordType": "adj",
      "audio": "https://stream-dict-laban.zdn.vn/uk/acfedad4dd6f211cdba5d00bf8690fda/18eb9384477/B/beefburger.mp3"
    },{
      "wordName": "Croissant",
      "wordMean": "Bánh sừng bò",
      "spelling": "/'krwʌsɒŋ/",
      "image": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT6gHWeLx5IyBTgAEtOU4-EWJ4OmqJn_BefhnwxT1sIVg&s",
      "wordType": "adj",
      "audio": "https://stream-dict-laban.zdn.vn/uk/d57419b8c4228187a3e50859f85351d9/18eb93d5ba7/C/croissant.mp3"
    },{
      "wordName": "Spaghetti",
      "wordMean": "Mì ý",
      "spelling": "/spə'geti/",
      "image": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS09-7jFsV0LzZnRD9ckZ4OQSyMHWq-LWxp2tHfJoH7LA&s",
      "wordType": "adj",
      "audio": "https://stream-dict-laban.zdn.vn/us/f740bb2b6bfb2e199f48752763657979/18eb93f509f/S/spaghetti.mp3"
    },
    {
      "wordName": "Food",
      "wordMean": "Món ăn",
      "spelling": "/fu:d/",
      "image": "https://upload.wikimedia.org/wikipedia/commons/thumb/6/6d/Good_Food_Display_-_NCI_Visuals_Online.jpg/800px-Good_Food_Display_-_NCI_Visuals_Online.jpg",
      "wordType": "n",
      "audio": "https://stream-dict-laban.zdn.vn/uk/97769b5056b5d2a35ac4c7aa3086c12e/18ea4c125bb/F/food.mp3"
    },
    {
      "wordName": "Delicious",
      "wordMean": "Ngon lành",
      "spelling": "/di'li∫əs/",
      "image": "https://learnitaliango.com/wp-content/uploads/2021/07/delicious-in-Italian.jpg",
      "wordType": "adj",
      "audio": "https://stream-dict-laban.zdn.vn/uk/2739cd3b362b249baa176482439ff133/18ea4c2f36d/D/delicious.mp3"
    },
    {
      "wordName": "Fantastic",
      "wordMean": "Kỳ quái",
      "spelling": "/fæn'tæstik/",
      "image": "https://media.istockphoto.com/id/1132010479/vector/wow-comic-sound-effect-speech-balloon.jpg?s=612x612&w=0&k=20&c=Tnvhbu-rPLf3q3_naS9RhPfLKF91KppHP1M5kqQivXs=",
      "wordType": "adj",
      "audio": "https://stream-dict-laban.zdn.vn/us/66230c994162f527b41afd50ec59f5d8/18ea4ca1a70/F/fantastic.mp3"
    },
  ];
  get data => _data;
}