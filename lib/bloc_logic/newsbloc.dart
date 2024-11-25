import 'package:bloc/bloc.dart';
import 'package:rolldice/bloc_logic/news_events.dart';
import 'package:rolldice/bloc_logic/news_state.dart';
import 'package:rolldice/service/api_service.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  NewsBloc({required this.service}) : super(IdleState()) {
    on(fetchArticles);
  }

  final ApiService service;

  Future<void> fetchArticles(NewsEvent event, Emitter<NewsState> state) async {
    emit(LoadingState());

    try {
      var response = await service.fetchArticles();
      emit(SuccessState(response));
    } catch (e) {
      emit(ErrorState(e));
    }
  }
}
