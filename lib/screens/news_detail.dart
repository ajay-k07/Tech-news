import 'package:flutter/material.dart';
//import 'package:news/bloc/stories_bloc.dart';
import 'dart:async';
import '../bloc/stories_provider.dart';
import '../widgets/news_list_tile.dart';
class NewsDetail extends StatelessWidget {
  final int itemId;
  NewsDetail({this.itemId});
  final bloc = StoriesBloc();

Widget build(context){
  return Scaffold(
    appBar: AppBar(
      title: Text('Details'),

    ),
    body: Text('$itemId'),
  ) ;
}

}