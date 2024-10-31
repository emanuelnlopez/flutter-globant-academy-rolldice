class NewsModel {
  NewsModel(this.author, this.title, this.description, this.image, this.date);

  String? author;
  String? title;
  String? description;
  String? image;
  String? date;

  factory NewsModel.fromJson(Map<String, dynamic> map) => NewsModel(
        map["author"],
        map["title"],
        map["description"],
        map["urlToImage"],
        map["publishedAt"],
      );

  static List<NewsModel> fromList(dynamic list) {
    List<NewsModel> models = [];

    for (var item in list) {
      models.add(NewsModel.fromJson(item));
    }

    return models;
  }
}
