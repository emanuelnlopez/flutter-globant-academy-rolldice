import 'package:rolldice/model/news_model.dart';
import 'package:rolldice/service/api_service.dart';

class MemoryApiService implements ApiService {
  static final news = [
    NewsModel(
      author: 'Emanuel López',
      title: 'Cross-Platform Development',
      description: 'Flutter enables developers to create apps that run on multiple platforms from a single codebase. By writing code once, you can deploy it on Android, iOS, web, and even desktop applications, which reduces development time and costs. Flutter’s widgets are customizable and adapt to each platform’s specific guidelines, ensuring a native look and feel across devices.',
      image: 'http://placehold.jp/30/F44336/ffffff/300x150.png?text=Cross-Platform+Development',
      date: '2024-11-05T20:21:47Z',
    ),
    NewsModel(
      author: 'Emanuel López',
      title: 'High Performance and Speed',
      description: 'Flutter is known for its impressive performance thanks to its unique architecture, which includes the Dart language and Skia graphics engine. Unlike other cross-platform frameworks that rely on a bridge to communicate with native components, Flutter compiles directly to native machine code. This leads to smoother animations, faster startup times, and an overall snappier user experience, making it an ideal choice for performance-intensive apps.',
      image: 'http://placehold.jp/30/3F51B5/ffffff/300x150.png?text=High+Performance+and+Speed',
      date: '2024-11-05T20:21:47Z',
    ),
    NewsModel(
      author: 'Emanuel López',
      title: 'Rich User Interface',
      description: 'Flutter provides a wide variety of customizable widgets that allow developers to create beautiful and highly responsive interfaces. With its rich widget library, developers can create complex, visually appealing UIs that are as detailed or unique as needed. Flutter also supports animations and effects with ease, giving developers the tools to craft engaging and interactive experiences.',
      image: 'http://placehold.jp/30/4CAF50/ffffff/300x150.png?text=Rich+User+Interface',
      date: '2024-11-05T20:21:47Z',
    ),
    NewsModel(
      author: 'Emanuel López',
      title: 'Hot Reload for Rapid Development',
      description: 'One of the most loved features in Flutter is "hot reload," which allows developers to see changes instantly without restarting the app. This significantly speeds up the development process, making it easier to experiment with UI, debug, and iterate quickly. Hot reload enables a more efficient workflow and faster turnaround on testing and feedback, which is particularly valuable for agile development.',
      image: 'http://placehold.jp/30/FF5722/ffffff/300x150.png?text=Hot+Reload+for+Rapid+Development',
      date: '2024-11-05T20:21:47Z',
    ),
    NewsModel(
      author: 'Emanuel López',
      title: 'Strong Community and Google Support',
      description: 'Flutter has a large and active community, supported by extensive resources and documentation, making it easier for developers to find help, share knowledge, and access plugins. As a Google-backed project, Flutter is regularly updated with new features and improvements. The official support and growing ecosystem ensure Flutter is a forward-thinking choice for developers, and its popularity in the industry suggests it will be a sustainable platform for years to come.',
      image: 'http://placehold.jp/30/795548/ffffff/300x150.png?text=Strong+Community+and+Google+Support',
      date: '2024-11-05T20:21:47Z',
    ),
  ];
  
  @override
  Future<List<NewsModel>> fetchArticles() {
    return Future.value(news);
  }
}
