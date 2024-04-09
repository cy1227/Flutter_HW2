import 'package:flutter/material.dart';
import 'package:flutter_hw2/book.dart';
import 'package:flutter_hw2/bookTile.dart';
import 'package:flutter_hw2/bookDetail.dart';
import 'package:flutter_hw2/drama.dart';
import 'package:flutter_hw2/dramaTile.dart';
import 'package:flutter_hw2/dramaDetail.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
      title: 'Flutter Demo',
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('推薦小說與影劇', style: TextStyle(color: Colors.white)),
          backgroundColor: Color.fromARGB(255, 143, 164, 247),
          bottom: const TabBar(
            tabs: [
              Tab(text: '小說'),
              Tab(text: '電視劇'),
            ],
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                  'https://i.pinimg.com/564x/9d/05/d9/9d05d95790b47d651602c0c352085452.jpg'), // 从网络加载图片
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.5),
                  BlendMode.dstATop), // 调整透明度为50%
            ),
          ),
          child: TabBarView(
            children: [
              //tap小說區塊
              ListView.builder(
                // 設置 ListView 的 padding
                padding: const EdgeInsets.all(20),
                // 設置 ListView 的項目數量為書籍列表的長度
                itemCount: books.length,
                // 定義 ListView 的項目構建器
                itemBuilder: (context, index) {
                  // 當項目被點擊時，導航到書籍詳情頁面
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          // 傳遞選擇的書籍到書籍詳情頁面
                          builder: (context) {
                            return BookDetail(book: books[index]);
                          },
                        ),
                      );
                    },
                    // 顯示書籍的縮略信息
                    child: BookTile(book: books[index]),
                  );
                },
              ),

              //電視劇
              GridView.builder(
                // 定義網格布局的參數
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // 橫軸方向的列數
                  crossAxisSpacing: 0, // 橫軸方向的間距
                  mainAxisSpacing: 0, // 縱軸方向的間距
                  childAspectRatio: 0.75, // 每個子元素的寬高比
                ),
                // 總共的項目數量為戲劇列表的長度
                itemCount: dramas.length,
                // 定義網格項目的構建器
                itemBuilder: (context, index) {
                  // 每個網格項目都是一個容器
                  return Container(
                    // 設置容器的外邊距
                    margin: EdgeInsets.all(8.0),
                    child: InkWell(
                      // 當容器被點擊時，導航到戲劇詳情頁面
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            // 傳遞選擇的戲劇到戲劇詳情頁面
                            builder: (context) {
                              return DramaDetail(drama: dramas[index]);
                            },
                          ),
                        );
                      },
                      // 顯示戲劇的縮略信息
                      child: DramaTile(drama: dramas[index]),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
