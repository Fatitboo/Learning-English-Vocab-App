import 'package:flutter/material.dart';

class RankingRow extends StatelessWidget {
  final Map wObj;
  const RankingRow({super.key, required this.wObj});

  @override
  Widget build(BuildContext context) {

    return Container(
        margin: const EdgeInsets.symmetric(vertical: 8),

        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Image.network(
                wObj["avatar"].toString(),
                width: 40,
                height: 40,
                fit: BoxFit.cover,
              ),
            ),

            const SizedBox(width: 15,),
            Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      wObj["fullname"].toString(),
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14, fontWeight: FontWeight.w500),
                    ),

                    Text(
                      wObj["score"].toString() + " points",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12,),
                    ),
                  ],
                )),

          ],
        ));
  }
}