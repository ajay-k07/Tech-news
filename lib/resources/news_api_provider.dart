import 'package:http/http.dart' show Client;
import 'dart:convert';
import '../model/item_model.dart';
import 'dart:async';

final _root = 'https://hacker-news.firebaseio.com/v0';
class NewApiProvider{
  Client client = Client();

  //fetch the top ids of stories from the hacker-news
 Future<List<int>> fetchTopIds  () async{
    final response = await client.get('$_root/topstories.json');
    final ids = json.decode(response.body);
    return ids.cast<int>();
  }
  // to fetch the story of the given id

 Future<ItemModel> fetchItems(int id)async{
    final response = await client.get('$_root/item/$id.json');
    final prasedJson = json.decode(response.body);
    //since the response contains mode data we are creating a model class of the coming data in model/item_model

    return ItemModel.fromJson(prasedJson);

  }


}
