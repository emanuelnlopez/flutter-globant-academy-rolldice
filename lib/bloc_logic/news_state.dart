import 'package:equatable/equatable.dart';
import 'package:rolldice/news_model.dart';

class NewsState extends Equatable {
  @override
  List<Object?> get props => [];
}

class IdleState extends NewsState {}

class LoadingState extends NewsState {}

class SuccessState extends NewsState {
  SuccessState(this.response);

  List<NewsModel> response;

  @override
  List<Object?> get props => [response];
}

class ErrorState extends NewsState {
  ErrorState(this.error);

  Object? error;

  @override
  List<Object?> get props => [error];
}
