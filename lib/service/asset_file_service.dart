import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:rolldice/model/news_model.dart';
import 'package:rolldice/service/api_service.dart';

class AssetFileService implements ApiService {
  @override
  Future<List<NewsModel>> fetchArticles() async {
    try {
      final data = await rootBundle.loadString('assets/news.json');
      return NewsModel.fromList(json.decode(data));
    } on Exception catch (_) {
      return [];
    }
  }
}
