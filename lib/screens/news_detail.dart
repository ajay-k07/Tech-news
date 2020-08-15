import 'package:flutter/material.dart';
import 'package:news/bloc/comments_provider.dart';
import 'package:news/model/item_model.dart';
import 'dart:async';
import '../widgets/comments.dart';
import '../widgets/loading_container.dart';

class NewsDetail extends StatelessWidget {
  final int itemId;
  NewsDetail({this.itemId});


Widget build(context){
  final bloc = CommentsProvider.of(context);
  return Scaffold(
    appBar: AppBar(
      title: Text('Details'),

    ),
    body: buildBody(bloc),
  ) ;
}
Widget buildBody(CommentsBloc bloc){
  return Container(
    child: StreamBuilder(
      stream: bloc.itemWithComments,
      builder: (context,AsyncSnapshot<Map<int,Future<ItemModel>>>snapshot){
        if(!snapshot.hasData){
          return LoadingContainer();
        }
        final itemFuture = snapshot.data[itemId];
        return FutureBuilder(
          future: itemFuture,
          builder: (context,AsyncSnapshot<ItemModel>itemSnapshot) {
              if(!itemSnapshot.hasData){
                return LoadingContainer();
              }
              return buildList(itemSnapshot.data,snapshot.data);
          },
        );
      },
    )
  );
}
Widget buildList(ItemModel item,Map<int,Future<ItemModel>>itemMap){
  final children =<Widget>[];
  children.add(buildTitle(item));

  final commentsList = item.kids.map((kidId) {
    return Comment(
      itemId: kidId,
      itemMap: itemMap,
      depth: 0,
    );
  }).toList();
  children.addAll(commentsList);
  return ListView(
    children: children,
  );

}
  Widget buildTitle(ItemModel item){
        return Container(

          alignment: Alignment.topCenter,
          margin: EdgeInsets.all(10.0),
          child: Text(item.title,
          textAlign: TextAlign.center,
            style: TextStyle(
              fontSize:20.0,
              fontWeight: FontWeight.bold,
              color: Colors.teal[500]

            ),
          ),
        );
  }
//  Widget urlButton(){
//        var url1 = 'www.google.com';
//        return Container(
//          child: RaisedButton(
//            autofocus: false,
//            onPressed: _launchURL(url1),
//            child: Text('Show Flutter homepage'),
//          ),
//        );
//  }
//  _launchURL(url1) async {
//   // const link = item.title;
//     var url = '$url1';
//    if (await canLaunch(url)) {
//      await launch(url);
//    } else {
//      throw 'Could not launch $url';
//    }
//  }


}