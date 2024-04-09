import 'package:flutter/material.dart';
import 'package:flutter_hw2/drama.dart';

class DramaTile extends StatelessWidget {
  const DramaTile({super.key, required this.drama});
  final Drama drama;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        color: Color.fromARGB(251, 247, 245, 192),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              Image.network(
                drama.imageUrl,
                width: 150,
                height: 200,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 4),
              Text(
                drama.name,
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
