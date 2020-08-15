import 'dart:async';
import 'package:flutter/material.dart';
import '../model/item_model.dart';
import 'loading_container.dart';


class Comment extends StatelessWidget {
  final int itemId;
  final Map<int, Future<ItemModel>> itemMap;
  final int depth;


  Comment({this.itemId, this.itemMap,this.depth});
    Widget build(context){
      return FutureBuilder(
        future: itemMap[itemId],
        builder: (context,AsyncSnapshot<ItemModel> snapshot){
          if(!snapshot.hasData){
            return LoadingContainer();
          }
          final children = <Widget>[
            ListTile(
              trailing: Icon(Icons.web),
              title: buildText(snapshot.data),
              subtitle: snapshot.data.by=="" ? Text("This comment is Deleted"):Text(snapshot.data.by),
              contentPadding: EdgeInsets.only(
                  right: 16.0,
                  left:(depth+1)*16.0,
              ),
            ),
            Divider(
              thickness: 10,
              color: Colors.blueGrey,
              height: 15,
            ),
          ];
          snapshot.data.kids.forEach((kidId) {
            children.add(Comment(
              itemId: kidId,
              itemMap: itemMap,
              depth: depth+1,
            ),);
          });
          return Column(
            children: children,
          );
        }
      );
    }
    Widget buildText(ItemModel item){
      final text = item.text.replaceAll('&quot;','').replaceAll('&gt;','').replaceAll('&#x27',"'" ).replaceAll('<p>','\n\n').replaceAll('</p>', '').replaceAll("';", "'").replaceAll('<a href="', '').replaceAll('</a>', '').replaceAll('</i>','').replaceAll('<i>','').replaceAll('#','');
      return Text(text);
    }
}