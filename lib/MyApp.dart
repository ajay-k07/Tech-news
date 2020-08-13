import 'package:flutter/material.dart';
import 'screens/news_list.dart';
import 'bloc/stories_provider.dart';
import 'screens/news_detail.dart';
class MyApp extends StatelessWidget{
  @override

  Widget build(BuildContext context) {

    return StoriesProvider(

      child: MaterialApp(
        title: 'TECH-news',
       onGenerateRoute: routes,
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
          final itemId=int.parse(settings.name.replaceFirst('/', ''));

          return NewsDetail(
            itemId:itemId,
          );
        },
      );
    }
  }
}