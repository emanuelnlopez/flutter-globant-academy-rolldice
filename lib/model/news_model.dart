class NewsModel {
  NewsModel({
    required this.author,
    required this.title,
    required this.description,
    required this.image,
    required this.date,
  });

  String? author;
  String? title;
  String? description;
  String? image;
  String? date;

  factory NewsModel.fromJson(Map<String, dynamic> map) => NewsModel(
        author: map["author"],
        title: map["title"],
        description: map["description"],
        image: map["urlToImage"],
        date: map["publishedAt"],
      );

  static List<NewsModel> fromList(dynamic list) {
    List<NewsModel> models = [];

    for (var item in list) {
      models.add(NewsModel.fromJson(item));
    }

    return models;
  }
}
