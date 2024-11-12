import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:newsapp/models/news_data.dart';
import 'package:newsapp/models/sourceReponse.dart';

class ApiManager{




  //https://newsapi.org/v2/top-headlines/sources?apiKey=8a9d66c57e4343c180b836945c8bb2c3

  static Future<SourseResponse> getSources(String id) async {

    Uri url =Uri.https('newsapi.org','v2/top-headlines/sources',
      {
        'apiKey':'8a9d66c57e4343c180b836945c8bb2c3',
        'category':id,
      }
    );
     http.Response response = await http.get(url);
     Map<String,dynamic>jsonFormat =jsonDecode(response.body);
     SourseResponse sourseResponse =SourseResponse.fromJson(jsonFormat);
    return sourseResponse;
  }



  static Future<NewsDataResponse>getNewsData(String sourceId) async {
    //https://newsapi.org/v2/everything?q=bitcoin&apiKey=8a9d66c57e4343c180b836945c8bb2c3
    Uri url=Uri.https('newsapi.org','v2/everything',
      {
        'apiKey':'8a9d66c57e4343c180b836945c8bb2c3',
        'sources':sourceId,
      }
    );
    http.Response response =await http.get(url);
    var jsonFormat =jsonDecode(response.body);
    NewsDataResponse newsDataResponse=NewsDataResponse.fromJson(jsonFormat);
    return newsDataResponse;
  }
}