import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class WordWidget extends StatelessWidget {
  WordWidget({super.key,
    required this.wordName,
    required this.wordMean,
    required this.spelling,
    required this.image,
    required this.audio,
    required this.wordType,
    required this.onTap,
    required this.saved,
    required this.onTapStar,
  });
  final String wordName;
  final String wordMean;
  final String spelling;
  final String image;
  final String audio;
  final String wordType;
  final bool saved;
  final VoidCallback onTapStar;
  final VoidCallback onTap;

  FlutterTts flutterTts = FlutterTts();

  Future _speak(String text) async{
    var result = await flutterTts.speak(text);
  }


  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(13),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                  color: Color(0x1f000000),
                  blurRadius: 10,
                  offset: Offset(0, 0.5)
              )
            ]),
        child: InkWell(
          onTap: () {
            onTap();
          },
          child: SingleChildScrollView(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Flexible(
                  flex: 4,
                  child: Row(
                    children: [
                      ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.network(image, width: 67, height: 67, fit: BoxFit.cover,)
                      ),
                      const SizedBox(width: 10,),
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text("$wordName ", overflow: TextOverflow.ellipsis, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Color(0xff252526)),),
                                Text("($wordType)", overflow: TextOverflow.ellipsis, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.normal, color: Color(0xff252526)),)
                              ],
                            ),
                            Text(spelling, style: const TextStyle(fontSize: 12, fontFamily: 'NotoSans',),),
                            const SizedBox(height: 2,),
                            Row(
                              children: [
                                Expanded(
                                    child: SizedBox(child: Text(wordMean, overflow: TextOverflow.ellipsis,style: const TextStyle(fontSize: 12),))),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SingleChildScrollView(
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          // playAudioFromUrl(audio);
                          _speak(wordName);
                        },
                        child: const Icon(
                          Icons.volume_up,
                          color: Colors.black45,
                          size: 24.0,
                        ),
                      ),
                      const SizedBox(width: 5,),
                      InkWell(
                        onTap: () {
                          onTapStar();
                        },
                        child: Icon(
                          saved ? Icons.star : Icons.star_outline,
                          color: saved ? Colors.orange : Colors.black45,
                          size: 24.0,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        )
    );
  }
}