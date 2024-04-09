import 'package:flutter/material.dart';
import 'package:flutter_hw2/book.dart';

import 'package:flutter_hw2/EpisodeDetailPage.dart';

//顯示小說詳情
class BookDetail extends StatelessWidget {
  const BookDetail({Key? key, required this.book}) : super(key: key);
  final Book book;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(book.name),
        backgroundColor: Color.fromARGB(255, 143, 164, 247),
      ),
      backgroundColor: Color.fromARGB(255, 210, 219, 255),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
                'https://i.pinimg.com/564x/00/a6/a5/00a6a50354d20fa3b1e2586f9c01f7ba.jpg'), // 从网络加载图片
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.5), BlendMode.dstATop), // 调整透明度为50%
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                book.imageUrl,
                width: 200,
                height: 300,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 20),
              Text(
                '作者：${book.author}',
                style: TextStyle(
                  // color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(15),
                child: Text(
                  '${book.description}',
                  style: TextStyle(
                    // color: Colors.white,
                    fontSize: 15.0,
                    // fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Column(
                children: List.generate(content.length, (index) {
                  return Card(
                    color: const Color.fromARGB(255, 156, 208, 250),
                    child: ListTile(
                      title: Text(
                        '第 ${index + 1} 集',
                        textAlign: TextAlign.center,
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => EpisodeDetailPage(
                              episodeTitle: '第 ${index + 1} 集',
                              episodeContent: content[index],
                            ),
                          ),
                        );
                      },
                    ),
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
