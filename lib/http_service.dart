import 'dart:convert';

import 'package:devcamp_news_app/news_list_model.dart';
import 'package:devcamp_news_app/topics_model.dart';
import 'package:http/http.dart' as http;

abstract class HttpService {
  Future<NewsList> fetchTopHeadlineNews(String country, String language, Topics topic);
  Future<NewsList> fetchSearchedNews(String query, String country, String language);
}

class NewsHttpService extends HttpService {
  final apiKeyParam = 'token=8424e58904dfbebd8df3e0924500538e';
  final newsBaseUrl = 'https://gnews.io/api/v4/';
  final topHeadlines = 'top-headlines';
  final search = 'search';

  @override
  Future<NewsList> fetchTopHeadlineNews(String country, String language, Topics topic) async {
    Uri uri = Uri.parse('$newsBaseUrl$topHeadlines?$apiKeyParam&topic=${topic.searchName}&lang=$language&country=$country');
    var response = await http.get(uri);
    return NewsList.fromJson(json.decode(response.body));
  }

  @override
  Future<NewsList> fetchSearchedNews(String query, String country, String language) async {
    Uri uri = Uri.parse('$newsBaseUrl$search?$apiKeyParam&lang=$language&country=$country&q=$query');
    var response = await http.get(uri);
    return NewsList.fromJson(json.decode(response.body));
  }
}
