import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:task_flutter_rwid/core/data/entity/news_dio_model.dart';
import 'package:task_flutter_rwid/core/data/remote/dio/dio_repository.dart';

part 'news_api_event.dart';
part 'news_api_state.dart';

class NewsApiBloc extends Bloc<NewsApiEvent, NewsApiState> {
  int _page = 1;
  bool _hasReachedMax = false;
  late String _currentCategory;
  final DioRepository dioRepository;
  NewsApiBloc(this.dioRepository) : super(NewsLoading()) {
    on<LoadNews>(_onLoadNews);
    on<LoadMoreNews>(_onLoadMoreNews);
    // on<LoadNews>(_onLoadNews);
  }

  // void _onLoadNews(LoadNews event, Emitter<NewsApiState> emit) async {
  //   try {
  //     emit(NewsLoading());
  //     final news = await dioRepository.getNews(event.selectedCategories ?? '');
  //     emit(NewsSuccess(news));
  //   } catch (e) {
  //     emit(NewsError(e.toString()));
  //   }
  // }

  Future<void> _onLoadNews(LoadNews event, Emitter<NewsApiState> emit) async {
    _currentCategory = event.selectedCategories;
    // if (_currentCategory != event.selectedCategories) {
    //   _currentCategory = event.selectedCategories;
    // }
    _page = 1;
    _hasReachedMax = false;
    if (event.isRefresh) {
      _page = 1;
      _hasReachedMax = false;
    }
    emit(NewsLoading());
    // else if (state is NewsSuccess) {
    //   return;
    // }

    try {
      final news = await dioRepository.getNews(
          page: _page, selectedCategories: _currentCategory);
      emit(NewsSuccess(
        news: news,
        hasReachedMax: _hasReachedMax,
      ));
    } catch (e) {
      emit(NewsError(message: e.toString()));
    }
  }

  Future<void> _onLoadMoreNews(
      LoadMoreNews event, Emitter<NewsApiState> emit) async {
    if (_hasReachedMax) return;
    if (state is! NewsSuccess) return;

    final currentState = state as NewsSuccess;
    _page++;

    try {
      final newNews = await dioRepository.getNews(
          page: _page, selectedCategories: _currentCategory);
      if (newNews.isEmpty) {
        _hasReachedMax = true;
        emit(currentState.copyWith(hasReachedMax: true));
      } else {
        emit(currentState.copyWith(
          news: List.of(currentState.news)..addAll(newNews),
          hasReachedMax: false,
        ));
      }
    } catch (e) {
      emit(NewsError(message: e.toString()));
    }
  }
}
