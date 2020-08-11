import 'package:flutter/material.dart';
//import 'package:news/bloc/stories_bloc.dart';
import 'dart:async';
import '../bloc/stories_provider.dart';
import '../src/news_list_tile.dart';
class NewsList extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    final bloc = StoriesProvider.of(context);
    bloc.fetchTopIds();
  return  Scaffold(
    appBar: AppBar(
      title: Text('TECH-news'),
    ),
    body: buildList(bloc)
  );
  }
  Widget buildList(StoriesBloc bloc){
    return StreamBuilder(
      stream: bloc.topIds,
      builder: (context,AsyncSnapshot<List<int>> snapshot){
        if(!snapshot.hasData){
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.yellow,
            )
          );
        }
        return ListView.builder(
          itemCount: snapshot.data.length,
          itemBuilder: (context ,int index){
          return NewsListTitle(itemId: snapshot.data[index]);
          },
        );
      },
    );
  }
}