import 'dart:async';
import 'news_api_provider.dart';
import 'news_dp_provider.dart';
import '../model/item_model.dart';

class Repository {


  NewApiProvider apiProvider = NewApiProvider();
  NewsDbProvider dbProvider = NewsDbProvider();

  Future<List<int>> fetchTopIds(){
    return apiProvider.fetchTopIds();
  }

  Future<ItemModel> fetchItem(int id)async{
    var item = await dbProvider.fetchItem(id);
    if(item!=null){
      return item;
    }else{
     item= await apiProvider.fetchItem(id);
     dbProvider.addItem(item);
     return item;
    }
  }

}

abstract class Source{
  Future<List<int>> fetchTopIds();
  Future<ItemModel> fetchItem(int id);
}
abstract class Cache{

}