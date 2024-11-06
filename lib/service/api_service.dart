import 'package:rolldice/model/news_model.dart';

abstract class ApiService {

  Future<List<NewsModel>> fetchArticles();
}
