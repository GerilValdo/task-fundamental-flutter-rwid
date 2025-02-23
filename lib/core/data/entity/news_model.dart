import 'package:objectbox/objectbox.dart';

@Entity()
class NewsModel {
  @Id()
  int id = 0;
  String? title, content, category, imageUrl;
  DateTime? date;

  NewsModel(
      {this.id = 0,
      this.title = '',
      this.content = '',
      this.category = '',
      this.imageUrl,
      this.date});
}
