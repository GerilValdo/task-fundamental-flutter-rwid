part of 'news_bloc.dart';

sealed class NewsEvent extends Equatable {
  const NewsEvent();

  @override
  List<Object> get props => [];
}

class GetNews extends NewsEvent {}

class AddNews extends NewsEvent {
  final NewsModel newsModel;
  const AddNews(this.newsModel);
}

class UpdateNews extends NewsEvent {
  final NewsModel newsModel;
  const UpdateNews(this.newsModel);
}

class DeleteNews extends NewsEvent {
  final int id;
  const DeleteNews(this.id);
}
