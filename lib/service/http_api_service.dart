import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:rolldice/model/news_model.dart';
import 'package:rolldice/service/api_service.dart';

class HttpApiService implements ApiService {
  @override
  Future<List<NewsModel>> fetchArticles() async {
    try {
      final uri = Uri.parse(
          'https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=56537b45c1384e46a13bc1a260de5333');

      final response = await http.get(uri);
      return NewsModel.fromList(json.decode(response.body)["articles"]);
    } on Exception catch (_) {
      return [];
    }
  }
}
