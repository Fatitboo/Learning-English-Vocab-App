import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class CardBack extends StatelessWidget{

  CardBack(this.wordMean, this.wordType, this.image);

  String wordMean;
  String wordType;
  String image;

  @override
  Widget build(BuildContext context) {
    return Transform(
      alignment: FractionalOffset.center,
      transform: Matrix4.identity()
        ..rotateY(pi),
      child: Container(
        width: 300,
        height: 500,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: const [
              BoxShadow(
                  color: Color(0x1f000000),
                  spreadRadius: 0,
                  blurRadius: 12,
                  offset: Offset(0, 0)
              )
            ]),
        child: Padding(
          padding: const EdgeInsets.only(top: 32, left: 36, right: 36, bottom: 70),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 90),
                child: Align(alignment: Alignment.center, child: Image.network(image)),
              ),
              Align(alignment: Alignment.bottomCenter,child: Text("($wordType) $wordMean", overflow: TextOverflow.ellipsis, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: Color(0xff252526)),)),
            ],
          ),
        ),
      ),
    );
  }

}