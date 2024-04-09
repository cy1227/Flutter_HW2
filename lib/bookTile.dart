import 'package:flutter/material.dart';
import 'package:flutter_hw2/book.dart';

//顯示小說在主頁面
class BookTile extends StatelessWidget {
  const BookTile({super.key, required this.book});
  final Book book;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 140,
      child: Card(
          color: Color.fromARGB(255, 176, 231, 255), // 设置卡片的颜色
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Row(
              children: [
                Image.network(
                  book.imageUrl,
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  book.name,
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          )),
    );
    // );
  }
}
