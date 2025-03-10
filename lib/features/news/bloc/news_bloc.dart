import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../core/data/entity/news_model.dart';
import '../../../core/data/local/objectbox/objectbox.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final ObjectBox objectBox;
  NewsBloc(this.objectBox) : super(NewsLoading()) {
    on<GetNews>(_onGetNews);
    on<AddNews>(_onAddNews);
    on<UpdateNews>(_onUpdateNews);
    on<DeleteNews>(_onDeleteNews);
  }

  void _onGetNews(GetNews event, Emitter<NewsState> emit) async {
    emit(NewsLoading());
    await Future.delayed(Duration(seconds: 2));
    final news = objectBox.store.box<NewsModel>().getAll();
    emit(NewsSuccess(news));
  }

  void _onAddNews(AddNews event, Emitter<NewsState> emit) async {
    emit(NewsLoading());
    await Future.delayed(Duration(seconds: 2));
    objectBox.store.box<NewsModel>().put(event.newsModel);
    emit(NewsSuccess(objectBox.store.box<NewsModel>().getAll()));
  }

  void _onUpdateNews(UpdateNews event, Emitter<NewsState> emit) async {
    emit(NewsLoading());
    await Future.delayed(Duration(seconds: 2));
    objectBox.store.box<NewsModel>().put(event.newsModel);
    emit(NewsSuccess(objectBox.store.box<NewsModel>().getAll()));
  }

  void _onDeleteNews(DeleteNews event, Emitter<NewsState> emit) async {
    emit(NewsLoading());
    await Future.delayed(Duration(seconds: 2));
    objectBox.store.box<NewsModel>().remove(event.id);
    emit(NewsSuccess(objectBox.store.box<NewsModel>().getAll()));
  }
}
