part of 'news_api_bloc.dart';

sealed class NewsApiEvent extends Equatable {
  const NewsApiEvent();

  @override
  List<Object> get props => [];
}

class LoadNews extends NewsApiEvent {
  final bool isRefresh;
  final String selectedCategories;
  const LoadNews({this.selectedCategories = '', this.isRefresh = false});
}

class LoadMoreNews extends NewsApiEvent {
  final String? selectedCategories;
  const LoadMoreNews({this.selectedCategories});
}
