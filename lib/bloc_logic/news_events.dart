import 'package:equatable/equatable.dart';

abstract class NewsEvent extends Equatable {}

class LoaderEvent extends NewsEvent {
  @override
  List<Object?> get props => [];
}

class LoadedEvent extends NewsEvent {
  @override
  List<Object?> get props => [];
}
