part of 'news_api_bloc.dart';

sealed class NewsApiState extends Equatable {
  const NewsApiState();

  @override
  List<Object> get props => [];
}

final class NewsLoading extends NewsApiState {}

final class NewsSuccess extends NewsApiState {
  final List<NewsDioModel> news;
  final bool hasReachedMax;

  const NewsSuccess({
    required this.news,
    this.hasReachedMax = false,
  });

  NewsSuccess copyWith({
    List<NewsDioModel>? news,
    bool? hasReachedMax,
  }) {
    return NewsSuccess(
      news: news ?? this.news,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  List<Object> get props => [news, hasReachedMax];
}

// final class NewsSuccess extends NewsApiState {
//   final List<NewsDioModel> news;
//   const NewsSuccess(this.news);
// }

final class NewsError extends NewsApiState {
  final String message;

  const NewsError({required this.message});

  @override
  List<Object> get props => [message];
}
