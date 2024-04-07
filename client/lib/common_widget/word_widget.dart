// import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class WordWidget extends StatelessWidget {
  WordWidget({super.key,
    required this.wordName,
    required this.wordMean,
    required this.spelling,
    required this.image,
    required this.audio,
    required this.wordType,
    required this.onTap,
  });
  final String wordName;
  final String wordMean;
  final String spelling;
  final String image;
  final String audio;
  final String wordType;
  final VoidCallback onTap;

  final player = AudioPlayer();
  Future<void> playAudioFromUrl(String url) async {
    // await player.play(UrlSource(url));
    await player.setUrl(url);                 // Schemes: (https: | file: | asset: )
    await player.play();                                  // Play without waiting for completion
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
                            const SizedBox(height: 5,),
                            Row(
                              children: [
                                Text(spelling, style: const TextStyle(fontSize: 12),),
                                const Text(": ", style: TextStyle(fontSize: 12),),
                                Text(wordMean, style: const TextStyle(fontSize: 12),),
                              ],
                            ),
                            const SizedBox(height: 5,),
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
                          playAudioFromUrl(audio);
                        },
                        child: const Icon(
                          Icons.volume_up,
                          color: Colors.black45,
                          size: 24.0,
                        ),
                      ),
                      SizedBox(width: 5,),
                      const Icon(
                        Icons.star_outline,
                        color: Colors.black45,
                        size: 24.0,
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