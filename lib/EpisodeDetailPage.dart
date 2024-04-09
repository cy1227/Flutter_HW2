import 'package:flutter/material.dart';

class EpisodeDetailPage extends StatelessWidget {
  final String episodeTitle;
  final String episodeContent;

  const EpisodeDetailPage({
    Key? key,
    required this.episodeTitle,
    required this.episodeContent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(episodeTitle),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            episodeContent,
            style: TextStyle(fontSize: 25),
          ),
        ),
      ),
    );
  }
}
