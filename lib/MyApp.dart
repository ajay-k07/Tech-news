import 'package:flutter/material.dart';
import 'screens/news_list.dart';
import 'bloc/stories_provider.dart';
import 'screens/news_detail.dart';
import 'bloc/comments_provider.dart';
class MyApp extends StatelessWidget{
  @override

  Widget build(BuildContext context) {
    return CommentsProvider(
      child: StoriesProvider(

        child: MaterialApp(
          title: 'TECH-news',
          onGenerateRoute: routes,
          theme:ThemeData.dark()

        ),
      ),
    );
  }

  Route routes(RouteSettings settings){
    if(settings.name=='/'){
      return MaterialPageRoute(
        builder: (context){
          return NewsList();
        },
      );
    }else{
      return MaterialPageRoute(
        builder: (context){
          final commentsBloc = CommentsProvider.of(context);
          final itemId=int.parse(settings.name.replaceFirst('/', ''));
          commentsBloc.fetchItemWithComments(itemId);
          return NewsDetail(
            itemId:itemId,
          );
        },
      );
    }
  }
}