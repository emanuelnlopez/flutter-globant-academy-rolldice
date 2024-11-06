import 'package:dio/dio.dart';
import 'package:rolldice/model/news_model.dart';
import 'package:rolldice/service/api_service.dart';

class DioApiService implements ApiService {
  final dio = Dio();

  @override
  Future<List<NewsModel>> fetchArticles() async {
    try {
      dynamic response = await dio.get(
          "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=56537b45c1384e46a13bc1a260de5333");
      return NewsModel.fromList((response as Response).data["articles"]);
    } on Exception catch (e) {
      return [];
    }
  }
}
