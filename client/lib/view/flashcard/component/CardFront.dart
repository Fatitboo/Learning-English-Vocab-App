import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class CardFront extends StatelessWidget{

  CardFront(this.wordName, this.audio);

  String wordName;
  String audio;


  final player = AudioPlayer();
  Future<void> playAudioFromUrl(String url) async {
    // await player.play(UrlSource(url));
    await player.setUrl(url);                 // Schemes: (https: | file: | asset: )
    await player.play();                                  // Play without waiting for completion
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
          ]
      ),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 26, left: 23),
            child: InkWell(
              onTap: () {
                playAudioFromUrl(audio);
              },
              child: const Icon(
                Icons.volume_up,
                color: Colors.black45,
                size: 32.0,
              ),
            ),
          ),
          Align(alignment: Alignment.center,child: Text(wordName, overflow: TextOverflow.ellipsis, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: Color(0xff252526)),)),
        ],
      ),
    );
  }

}