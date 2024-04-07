import 'package:client/common_widget/progress_bar.dart';
import 'package:flutter/material.dart';

class StatiscalView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Statistics'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Avatar and Name
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/images/img.png'), // Thay đổi đường dẫn ảnh avatar tương ứng
            ),
            SizedBox(height: 5),
            Text(
              'tinhphan1508', // Thay đổi thành tên người dùng
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 30),

            // Topic Statistics
            _buildStatisticItem('Number of topics completed:', '5/10', Colors.deepOrange), // Thay đổi số chủ đề đã học/tổng số chủ đề
            SizedBox(height: 10),
            ProgressStack(
              value: 5, // Tiến độ là 70%
              max: 10, // Chiều rộng tối đa của thanh
              valueColor: Colors.deepOrange, // Màu sắc của thanh tiến độ
              maxColor: Colors.black12, // Màu sắc của thanh giá trị tối đa
          ),
            SizedBox(height: 10),

            // Vocabulary Statistics
            _buildStatisticItem('Vocabularies learned:', '200/500', Colors.green), // Thay đổi số từ vựng đã học/tổng số từ vựng
            SizedBox(height: 10),
            ProgressStack(
              value: 200, // Tiến độ là 70%
              max: 400, // Chiều rộng tối đa của thanh
              valueColor: Colors.green, // Màu sắc của thanh tiến độ
              maxColor: Colors.black12, // Màu sắc của thanh giá trị tối đa
            ),
            SizedBox(height: 30),
            _buildStatisticItem('Your score:', '258 points', Colors.blue),
            SizedBox(height: 10),
            _buildStatisticItem('Your ranking:', '3/122 users', Colors.deepPurple),
            SizedBox(height: 30),

            // Ranking List
            Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black26, // Màu của border
                  width: 2, // Độ dày của border
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'RANKING LIST',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                ],
              )
            ),
            SizedBox(height: 20),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black26, // Màu của border
                    width: 2, // Độ dày của border
                  ),
                ),
                child: ListView.builder(
                  itemCount: 10, // Thay đổi số lượng người dùng trong danh sách
                  itemBuilder: (context, index) {
                    return _buildRankingItem(
                      rank: (index + 1).toString(),
                      avatar: 'assets/images/img.png', // Thay đổi đường dẫn ảnh avatar tương ứng
                      name: 'tinhphan1508${index + 1}', // Thay đổi tên người dùng
                      points: (1000 - index * 50).toString(), // Thay đổi số điểm tương ứng
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatisticItem(String title, String value, Color color) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 16, color: color, fontWeight: FontWeight.w500),
        ),
        Text(
          value,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget _buildRankingItem({required String rank, required String avatar, required String name, required String points}) {
    return ListTile(
      leading: CircleAvatar(
        radius: 20,
        backgroundImage: AssetImage(avatar), // Avatar của người dùng
      ),
      title: Text(
        '$rank. $name',
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        'Points: $points', // Số điểm của người dùng
        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
      ),
      hoverColor: Colors.grey,
      focusColor: Colors.grey,
      selectedColor: Colors.grey,
    );
  }
}
