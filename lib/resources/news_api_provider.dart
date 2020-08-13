import 'dart:convert';
import 'package:http/http.dart' show Client;
import '../model/item_model.dart';
import 'dart:async';
import 'repository.dart';

//final _root = 'https://hacker-news.firebaseio.com/v0';

class NewsApiProvider implements Source {
  Client client = Client();

  Future<List<int>> fetchTopIds() async {
    final response = await client.get('https://hacker-news.firebaseio.com/v0/topstories.json');
    final ids = json.decode(response.body);
    print(ids);

    return ids.cast<int>();
  }

  Future<ItemModel> fetchItem(int id) async {
    final response = await client.get('https://hacker-news.firebaseio.com/v0/item/$id.json');
    final parsedJson = json.decode(response.body);

    return ItemModel.fromJson(parsedJson);
  }
}
