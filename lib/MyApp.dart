import 'package:flutter/material.dart';
import 'screens/news_list.dart';
import 'bloc/stories_provider.dart';
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return StoriesProvider(
      child: MaterialApp(
        title: 'TECH-news',
        home:NewsList(),
      ),
    );
  }
}