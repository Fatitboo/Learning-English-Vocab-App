import 'package:flutter/material.dart';

class ProgressStack extends StatelessWidget {
  final double value; // Giá trị tiến độ
  final double max; // Giá trị tối đa
  final Color valueColor;
  final Color maxColor;

  ProgressStack({required this.value, required this.max, required this.valueColor, required this.maxColor});

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double progressWidth = value / max * deviceWidth; // Chiều rộng của thanh progress

    return Stack(
      children: [
        Container(
          width: deviceWidth, // Chiều rộng của thanh max
          height: 20,
          decoration: BoxDecoration(
            color: maxColor, // Màu sắc của thanh max
            borderRadius: BorderRadius.circular(10), // BorderRadius cho các góc
          ),
        ),
        Container(
          width: progressWidth,
          height: 20,
          decoration: BoxDecoration(
            color: valueColor, // Màu sắc của thanh progress
            borderRadius: BorderRadius.circular(10), // BorderRadius cho các góc
          ),
          child: Center(
            child: Text(
              '${(value / max * 100).toStringAsFixed(0)}%', // Hiển thị tiến độ %
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
