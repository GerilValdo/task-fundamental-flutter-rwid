part of 'news_bloc.dart';

sealed class NewsState extends Equatable {
  const NewsState();

  @override
  List<Object> get props => [];
}

final class NewsLoading extends NewsState {}

final class NewsSuccess extends NewsState {
  final List<NewsModel> news;
  const NewsSuccess(this.news);
}

final class NewsError extends NewsState {}
