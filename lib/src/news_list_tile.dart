import 'package:flutter/material.dart';
import 'package:news/model/item_model.dart';
import 'package:news/bloc/stories_provider.dart';
import 'dart:async';


class NewsListTitle extends StatelessWidget{
  final int itemId;
  NewsListTitle({this.itemId});
  @override
  Widget build(BuildContext context) {
    final bloc = StoriesProvider.of(context);
   return StreamBuilder(
       stream: bloc.items,
       builder: (context, AsyncSnapshot<Map<int,Future<ItemModel>>> snapshot){
         if(!snapshot.hasData){
           return Text('Stream Still loading');
         }
         return FutureBuilder(
             future: snapshot.data[itemId],
             builder: (context, AsyncSnapshot<ItemModel> itemSnapshot ){
               if(!itemSnapshot.hasData){
                 return Text('still loading ');
               }
               return Text(itemSnapshot.data.title);
             });
       },
   );

  }

}