import 'dart:async';
import 'dart:collection';
import 'dart:math';
import 'package:client/view/flashcard/component/CardBack.dart';
import 'package:client/view/flashcard/component/CardFront.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import 'package:flutter/material.dart';

class FlashCardPage extends StatefulWidget {
  const FlashCardPage({super.key});

  @override
  FlashCardPageState createState() => FlashCardPageState();
}

class FlashCardPageState extends State<FlashCardPage> with TickerProviderStateMixin {

  late Animation _animation;
  late AnimationController _animationController;
  AnimationStatus _status = AnimationStatus.dismissed;

  List<dynamic> data = [
    {
    "wordName": "Food",
    "wordMean": "Món ăn",
    "spelling": "/fu:d/",
    "image": "https://upload.wikimedia.org/wikipedia/commons/thumb/6/6d/Good_Food_Display_-_NCI_Visuals_Online.jpg/800px-Good_Food_Display_-_NCI_Visuals_Online.jpg",
    "wordType": "n",
    "audio": "https://stream-dict-laban.zdn.vn/uk/97769b5056b5d2a35ac4c7aa3006c12e/18ea4c125bb/F/food.mp3",
    },
    {
    "wordName": "Delicious",
    "wordMean": "Ngon lành",
    "spelling": "/di'li∫əs/",
    "image": "https://learnitaliango.com/wp-content/uploads/2021/07/delicious-in-Italian.jpg",
    "wordType": "adj",
    "audio": "https://stream-dict-laban.zdn.vn/uk/2739cd3b362b249baa176482439ff133/18ea4c2f36d/D/delicious.mp3",
    },
    {
    "wordName": "Fantastic",
    "wordMean": "Kỳ quái",
    "spelling": "/fæn'tæstik/",
    "image": "https://media.istockphoto.com/id/1132010479/vector/wow-comic-sound-effect-speech-balloon.jpg?s=612x612&w=0&k=20&c=Tnvhbu-rPLf3q3_naS9RhPfLKF91KppHP1M5kqQivXs=",
    "wordType": "adj",
    "audio": "https://stream-dict-laban.zdn.vn/us/66230c994162f527b41afd50ec59f5d8/18ea4ca1a70/F/fantastic.mp3",
    },
    {
      "wordName": "Food2",
      "wordMean": "Món ăn",
      "spelling": "/fu:d/",
      "image": "https://upload.wikimedia.org/wikipedia/commons/thumb/6/6d/Good_Food_Display_-_NCI_Visuals_Online.jpg/800px-Good_Food_Display_-_NCI_Visuals_Online.jpg",
      "wordType": "n",
      "audio": "https://stream-dict-laban.zdn.vn/uk/97769b5056b5d2a35ac4c7aa3006c12e/18ea4c125bb/F/food.mp3",
    },
    {
      "wordName": "Delicious2",
      "wordMean": "Ngon lành",
      "spelling": "/di'li∫əs/",
      "image": "https://learnitaliango.com/wp-content/uploads/2021/07/delicious-in-Italian.jpg",
      "wordType": "adj",
      "audio": "https://stream-dict-laban.zdn.vn/uk/2739cd3b362b249baa176482439ff133/18ea4c2f36d/D/delicious.mp3",
    },
    {
      "wordName": "Fantastic2",
      "wordMean": "Kỳ quái",
      "spelling": "/fæn'tæstik/",
      "image": "https://media.istockphoto.com/id/1132010479/vector/wow-comic-sound-effect-speech-balloon.jpg?s=612x612&w=0&k=20&c=Tnvhbu-rPLf3q3_naS9RhPfLKF91KppHP1M5kqQivXs=",
      "wordType": "adj",
      "audio": "https://stream-dict-laban.zdn.vn/us/66230c994162f527b41afd50ec59f5d8/18ea4ca1a70/F/fantastic.mp3",
    },
    {
      "wordName": "Food3",
      "wordMean": "Món ăn",
      "spelling": "/fu:d/",
      "image": "https://upload.wikimedia.org/wikipedia/commons/thumb/6/6d/Good_Food_Display_-_NCI_Visuals_Online.jpg/800px-Good_Food_Display_-_NCI_Visuals_Online.jpg",
      "wordType": "n",
      "audio": "https://stream-dict-laban.zdn.vn/uk/97769b5056b5d2a35ac4c7aa3006c12e/18ea4c125bb/F/food.mp3",
    },
    {
      "wordName": "Delicious3",
      "wordMean": "Ngon lành",
      "spelling": "/di'li∫əs/",
      "image": "https://learnitaliango.com/wp-content/uploads/2021/07/delicious-in-Italian.jpg",
      "wordType": "adj",
      "audio": "https://stream-dict-laban.zdn.vn/uk/2739cd3b362b249baa176482439ff133/18ea4c2f36d/D/delicious.mp3",
    },
    {
      "wordName": "Fantastic3",
      "wordMean": "Kỳ quái",
      "spelling": "/fæn'tæstik/",
      "image": "https://media.istockphoto.com/id/1132010479/vector/wow-comic-sound-effect-speech-balloon.jpg?s=612x612&w=0&k=20&c=Tnvhbu-rPLf3q3_naS9RhPfLKF91KppHP1M5kqQivXs=",
      "wordType": "adj",
      "audio": "https://stream-dict-laban.zdn.vn/us/66230c994162f527b41afd50ec59f5d8/18ea4ca1a70/F/fantastic.mp3",
    },
    {
      "wordName": "Food4",
      "wordMean": "Món ăn",
      "spelling": "/fu:d/",
      "image": "https://upload.wikimedia.org/wikipedia/commons/thumb/6/6d/Good_Food_Display_-_NCI_Visuals_Online.jpg/800px-Good_Food_Display_-_NCI_Visuals_Online.jpg",
      "wordType": "n",
      "audio": "https://stream-dict-laban.zdn.vn/uk/97769b5056b5d2a35ac4c7aa3006c12e/18ea4c125bb/F/food.mp3",
    },
    {
      "wordName": "Delicious4",
      "wordMean": "Ngon lành",
      "spelling": "/di'li∫əs/",
      "image": "https://learnitaliango.com/wp-content/uploads/2021/07/delicious-in-Italian.jpg",
      "wordType": "adj",
      "audio": "https://stream-dict-laban.zdn.vn/uk/2739cd3b362b249baa176482439ff133/18ea4c2f36d/D/delicious.mp3",
    },
    {
      "wordName": "Fantastic4",
      "wordMean": "Kỳ quái",
      "spelling": "/fæn'tæstik/",
      "image": "https://media.istockphoto.com/id/1132010479/vector/wow-comic-sound-effect-speech-balloon.jpg?s=612x612&w=0&k=20&c=Tnvhbu-rPLf3q3_naS9RhPfLKF91KppHP1M5kqQivXs=",
      "wordType": "adj",
      "audio": "https://stream-dict-laban.zdn.vn/us/66230c994162f527b41afd50ec59f5d8/18ea4ca1a70/F/fantastic.mp3",
    },
  ];

  late Queue<dynamic> learnedWords;

  double _leftValue = 0;
  double _topValue = 90;
  int _time = 300;
  double _currentOpacity = 0;
  bool isLeft = true;
  Color _color = Color(0xffFFE8D4);

  double width = 0;

  int _index = 0;
  @override
  void initState() {
    super.initState();
    learnedWords = Queue();
    dynamic a = data[0];
    learnedWords.add(a);
    _animationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 300));
    _animation = Tween(end: 1.0, begin: 0.0).animate(_animationController)
      ..addListener(() {
        setState(() {

        });
      })
      ..addStatusListener((status) {
        _status = status;
      });
    final mediaQuery = (context.getElementForInheritedWidgetOfExactType<MediaQuery>()!.widget as MediaQuery).data;
    final physicalSize = mediaQuery.size * mediaQuery.devicePixelRatio;
    width = physicalSize.width / 2;
    _leftValue = (width - 300) / 2;
    print(width);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Stack(
            children: [
              Align(alignment: Alignment.topCenter, child: Stack(
                children: [
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Icon(
                      Icons.close,
                      color: Colors.black,
                      size: 16.0,
                    ),
                  ),
                  Align(alignment: Alignment.center,child: Text("${_index + 1}/${data.length}", style: const TextStyle(color: Colors.black45, fontSize: 16),))
                ]
             )),
            ]
        ),
      ),
      backgroundColor: Colors.white,
      body: Stack(
        alignment: Alignment.topCenter,
        // mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: const EdgeInsets.only(left: 30, right: 30, bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Transform(
                    alignment: FractionalOffset.center,
                    transform: Matrix4.identity()
                      ..rotateY(pi),
                    child: InkWell(
                      onTap: (){
                        setState(() {
                          // if(_index == 0){
                          //   return;
                          // }
                          // learnedWords.add(data[--_index]);
                          // learnedWords.remove(learnedWords.first);
                          // data[_index]["remember"] = "false";
                          // _animationController.value = 0;
                        });
                      },
                      child: const Icon(
                        Icons.redo_outlined,
                        color: Colors.black87,
                        size: 32.0,
                      ),
                    ),
                  ),
                  _isPlay ? InkWell(
                    onTap: () {
                      _timer.cancel();
                      _isNext = false;
                      _isRemember = false;
                      setState(() {
                        _isPlay = false;
                      });
                    },
                    child: const Icon(
                      Icons.stop_circle_outlined,
                      color: Colors.black87,
                      size: 32.0,
                    ),
                  ):
                  InkWell(
                    onTap: () {
                      _timer = Timer.periodic(const Duration(seconds: 2), slideCard);
                      _animationController.value = 0;
                      setState(() {
                        _isPlay = true;
                      });
                    },
                    child: const Icon(
                      Icons.play_arrow,
                      color: Colors.black87,
                      size: 32.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 90),
            width: 300,
            height: 500,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: const [
                  BoxShadow(
                      color: Color(0x1f000000),
                      blurRadius: 12,
                      offset: Offset(0, 4)
                  )
                ]),
          ),
          Stack(
            children: [
              for(int i = 0; i < learnedWords.length; i++)
                AnimatedPositioned(
                top: _topValue,
                left: _leftValue,
                duration: Duration(milliseconds: _time),
                child: GestureDetector(
                onPanUpdate: (details) => setState(() {
                  setState(() {
                    _topValue += details.delta.dy;
                    _leftValue += details.delta.dx;
                    if(_leftValue - (width - 300)/ 2 >= 0){
                      isLeft = false;
                      _color = Color(0xff1CD0AF).withOpacity(_currentOpacity + 0.3 < 1 ? _currentOpacity + 0.3 : 1);
                    }
                    else{
                      isLeft = true;
                      _color = Color(0xffFF8838).withOpacity(_currentOpacity + 0.3 < 1 ? _currentOpacity + 0.3 : 1);
                    }
                    _currentOpacity = 1 - exp(-1/60 * (_leftValue - (width - 300) / 2).abs());
                    _time = 10;
                  });
                }),
                onPanEnd: (a) => {
                  setState(() {
                    double temp = _leftValue;
                    _topValue = 90;
                    _leftValue = (width - 300) / 2;
                    _currentOpacity = 0;
                    _time = 300;
                    if(isLeft){
                      _color = Color(0xffFFE8D4);
                    }
                    else{
                      _color = Color(0xffD9FFF1);
                    }
                    if((temp - (width - 300) / 2).abs() > 150){
                      _time = 0;
                      _animationController.value = 0;
                      if(_index == data.length - 1){
                        print("success");
                      }else{
                        learnedWords.add(data[++_index]);
                        learnedWords.remove(learnedWords.first);
                        if(isLeft){
                          data[_index]["remember"] = "false";
                        }
                        else{
                          data[_index]["remember"] = "true";
                        }
                        print(learnedWords);
                      }
                    }
                  }),
                },
                child: Stack(
                  children: [
                    Transform(
                    alignment: FractionalOffset.center,
                    transform: Matrix4.identity()
                      ..setEntry(3, 2, 0.001)
                      ..rotateY(pi * _animationController.value),
                    child: Center(
                      child: Container(
                        child: _animationController.value <= 0.5
                            ? GestureDetector(
                          onTap: () {
                            _animationController.forward();
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(16),
                                boxShadow: const [
                                  BoxShadow(
                                      color: Color(0x1f000000),
                                      blurRadius: 12,
                                      offset: Offset(0, 4)
                                  )
                                ]),
                            child: Stack(
                              children: [
                                AnimatedOpacity(
                                  opacity: _currentOpacity,
                                  duration: Duration(milliseconds: _time),
                                  child:
                                  isLeft ?
                                    Container(
                                      width: 300,
                                      height: 500,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(16),
                                          border: Border.all(color: const Color(0xffFF8838)),
                                          boxShadow: const [
                                            BoxShadow(
                                                color: Color(0x1f000000),
                                                blurRadius: 12,
                                                offset: Offset(0, 4)
                                            )
                                          ]
                                      ),
                                      child: const Center(child: Text("Still learning", style: TextStyle(fontSize: 34, color: Color(0xffFF8838), fontWeight: FontWeight.w500))),
                                    ) :
                                    Container(
                                      width: 300,
                                      height: 500,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(16),
                                          border: Border.all(color: const Color(0xff1CD0AF)),
                                          boxShadow: const [
                                            BoxShadow(
                                                color: Color(0x1f000000),
                                                blurRadius: 12,
                                                offset: Offset(0, 4)
                                            )
                                          ]
                                      ),
                                      child: const Center(child: Text("Know", style: TextStyle(fontSize: 34, color: Color(0xff1CD0AF), fontWeight: FontWeight.w500))),
                                    ),
                                ),
                                AnimatedOpacity(
                                    opacity: 1 - sqrt(_currentOpacity),
                                    duration: const Duration(milliseconds: 10),
                                    child: CardFront(learnedWords.elementAt(i)["wordName"], learnedWords.elementAt(i)["audio"])
                                ),
                              ],
                            ),
                          ),
                        ):
                        GestureDetector(
                          onTap: () {
                            _animationController.reverse();
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(16),
                                boxShadow: const [
                                  BoxShadow(
                                      color: Color(0x1f000000),
                                      blurRadius: 12,
                                      offset: Offset(0, 4)
                                  )
                                ]),
                            child: Stack(
                              children: [
                                AnimatedOpacity(
                                    opacity: 1 - sqrt(_currentOpacity),
                                    duration: const Duration(milliseconds: 10),
                                    child: CardBack(learnedWords.elementAt(i)["wordMean"], learnedWords.elementAt(i)["wordType"], learnedWords.elementAt(i)["image"]),
                                ),
                                Transform(
                                  alignment: FractionalOffset.center,
                                  transform: Matrix4.identity()
                                    ..rotateY(pi),
                                  child: AnimatedOpacity(
                                    opacity: _currentOpacity,
                                    duration: Duration(milliseconds: _time),
                                    child: (width - 300) / 2 - _leftValue > 0 ?
                                    Container(
                                      width: 300,
                                      height: 500,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(16),
                                          border: Border.all(color: const Color(0xffFF8838)),
                                          boxShadow: const [
                                            BoxShadow(
                                                color: Color(0x1f000000),
                                                blurRadius: 12,
                                                offset: Offset(0, 4)
                                            )
                                          ]
                                      ),
                                      child: const Center(child: Text("Still learning", style: TextStyle(fontSize: 34, color: Color(0xffFF8838), fontWeight: FontWeight.w500))),
                                    ) :
                                    Container(
                                      width: 300,
                                      height: 500,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(16),
                                          border: Border.all(color: const Color(0xff1CD0AF)),
                                          boxShadow: const [
                                            BoxShadow(
                                                color: Color(0x1f000000),
                                                blurRadius: 12,
                                                offset: Offset(0, 4)
                                            )
                                          ]
                                      ),
                                      child: const Center(child: Text("Know", style: TextStyle(fontSize: 34, color: Color(0xff1CD0AF), fontWeight: FontWeight.w500))),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  ],
                ),
              ),
            )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AnimatedContainer(
                  padding: const EdgeInsets.only(right: 15),
                  width: 60,
                  height: 40,
                  decoration: BoxDecoration(
                    color: isLeft ? _color : const Color(0xffFFE8D4),
                    border: Border.all(color: const Color(0xffFF8838)),
                    borderRadius: const BorderRadius.only(topRight: Radius.circular(90), bottomRight: Radius.circular(90)),
                  ),
                  duration: Duration(milliseconds: _time),
                  child: Align(alignment: Alignment.centerRight,child:
                  _leftValue - (width - 300) / 2 < 0 ?
                  const Text("+1", style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),):
                  Text("${getCountLearned(false)}", style: const TextStyle(color: Color(0xffFF8838), fontSize: 16, fontWeight: FontWeight.w500),)
                  ),
                ),
                AnimatedContainer(
                  duration: Duration(milliseconds: _time),
                  padding: const EdgeInsets.only(left: 15),
                  width: 60,
                  height: 40,
                  decoration: BoxDecoration(
                    color: isLeft ? const Color(0xffD9FFF1) : _color,
                    border: Border.all(color: const Color(0xff1CD0AF)),
                    borderRadius: const BorderRadius.only(topLeft: Radius.circular(90), bottomLeft: Radius.circular(90)),
                  ),
                  child: Align(alignment: Alignment.centerLeft, child:
                  _leftValue - (width - 300) / 2 > 0 ?
                  const Text("+1", style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),):
                  Text("${getCountLearned(true)}", style: const TextStyle(color: Color(0xff1CD0AF), fontSize: 16, fontWeight: FontWeight.w500),)
                  ),
                )
              ],
            ),
          ),
          Row(
            children: [
              Flexible(
                child: LinearPercentIndicator(
                  lineHeight: 3.0,
                  percent: (_index)  / (data.length),
                  barRadius: const Radius.circular(4),
                  padding: const EdgeInsets.only(top: 0, left: 0),
                  progressColor: const Color(0xff5885DD),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
  late Timer _timer;
  bool _isPlay = false;
  bool _isNext = false;
  bool _isRemember = false;
  void slideCard(Timer timer) {
    if(_isNext){
      _animationController.value = 0;
      setState(() {
        _leftValue = (width - 300) / 2;
        _topValue = 90;
        _leftValue = (width - 300) / 2;
        _currentOpacity = 0;
        _time = 10;
          _color = Color(0xffD9FFF1);
      });
      _isNext = false;
    }
    else{
      if(_isRemember){
        _isRemember = false;
        _isNext = true;
        setState(() {
          if(_index + 1 == data.length){
            _timer.cancel();
            _isPlay = false;
            _isRemember = false;
            _isNext = false;
          }else {
            learnedWords.add(data[++_index]);
            learnedWords.remove(learnedWords.first);
            data[_index]["remember"] = "true";
            _leftValue = _leftValue + 200;
            _topValue = _topValue + 120;
            isLeft = false;
            _color = Color(0xff1CD0AF).withOpacity(
                _currentOpacity + 0.3 < 1 ? _currentOpacity + 0.3 : 1);
            _currentOpacity =
                1 - exp(-1 / 60 * (_leftValue - (width - 300) / 2).abs());
            _time = 500;
          }
        });
      }
      else{
        _animationController.value = 1;
        _isRemember = true;
      }
    }
  }
  int getCountLearned(bool isRemember){
    int sum = 0;
    if(isRemember){
      for(int i = 0; i < data.length; i++) {
        if(data.elementAt(i)["remember"] != null){
          sum += data.elementAt(i)["remember"] == "true" ? 1 : 0;
        }
      }
    }
    else{
      for(int i = 0; i < data.length; i++) {
        if(data.elementAt(i)["remember"] != null){
          sum += data.elementAt(i)["remember"] == "false" ? 1 : 0;
        }
      }
    }
    return sum;
  }
}



