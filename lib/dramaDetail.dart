import 'package:flutter/material.dart';
import 'package:flutter_hw2/drama.dart';

class DramaDetail extends StatelessWidget {
  const DramaDetail({Key? key, required this.drama}) : super(key: key);
  final Drama drama;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(drama.name + '主要角色'),
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
                Colors.black.withOpacity(0.5), BlendMode.dstATop), // 透明度50%
          ),
        ),
        margin: EdgeInsets.all(0),
        child: Padding(
          padding: EdgeInsets.all(35),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                drama.imageUrl,
                width: 200,
                height: 300,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 30),
              // Text(drama.description),
              Row(
                children: [
                  character(drama.rolePic[0], drama.roleName[0]),
                  SizedBox(width: 40),
                  character(drama.rolePic[1], drama.roleName[1]),
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  character(drama.rolePic[2], drama.roleName[2]),
                  SizedBox(width: 40),
                  character(drama.rolePic[3], drama.roleName[3]),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget character(String imageUrl, String text) {
  return Column(
    children: [
      Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Color.fromARGB(255, 151, 148, 241), // 边框颜色
            width: 5, // 边框宽度
          ),
          borderRadius: BorderRadius.circular(80), // 圆角半径
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(80),
          child: Image.network(
            imageUrl,
            fit: BoxFit.cover,
            width: 150,
            height: 150,
          ),
        ),
      ),
      SizedBox(height: 8),
      Text(
        text,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    ],
  );
}
