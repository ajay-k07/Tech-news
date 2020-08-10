import 'package:news/resources/news_api_provider.dart';
import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:http/testing.dart';

void main(){


  test('fetch top ids',
      ()async{
   final newsApi = NewApiProvider();
    newsApi.client=  MockClient((request) async {
     return Response(json.encode([1,2,3]), 200);
   });
    final ids = await newsApi.fetchTopIds();
    expect(ids,[1,2,3]);
      });
  
  test('fetch item',()async{
    final newsApi = NewApiProvider();
    newsApi.client = new MockClient((request)async{
      return Response(json.encode({'id':123}),200);
    });
    final item = await newsApi.fetchItems(999);
    expect(item.id, 123);
  });
  
}