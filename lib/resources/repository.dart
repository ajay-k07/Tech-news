import 'dart:async';
import 'news_api_provider.dart';
import 'news_dp_provider.dart';
import '../model/item_model.dart';

class Repository {
  List<Source> sources = <Source>[
    NewApiProvider(),
    newsDbProvider,
  ];
  List<Cache> caches= <Cache>[
    newsDbProvider,
  ];

//  NewApiProvider apiProvider =
//  NewsDbProvider dbProvider =

  Future<List<int>> fetchTopIds(){
    return sources[0].fetchTopIds();
  }

  Future<ItemModel> fetchItem(int id)async{
   ItemModel item;
   var source;
   for(source in sources){
     item = await source.fetchItem(id);
     if(item!=null){
       break;
     }
   }
   for(var cache in caches){
     cache.addItem(item);
   }
   return item;
  }

}

abstract class Source{
  Future<List<int>> fetchTopIds();
  Future<ItemModel> fetchItem(int id);
}
abstract class Cache{
     Future<int> addItem(ItemModel item);
}