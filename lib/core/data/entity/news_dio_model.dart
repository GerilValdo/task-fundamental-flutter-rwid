// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class NewsDioModel {
  int id = 0;
  String? title;
  String? content;
  String? author;
  String? imageUrl;
  String? date;

  NewsDioModel(
      {this.id = 0,
      this.title,
      this.content,
      this.author,
      this.imageUrl,
      this.date});

  NewsDioModel copyWith({
    int? id,
    String? title,
    String? content,
    String? author,
    String? imageUrl,
    String? date,
  }) {
    return NewsDioModel(
      id: id ?? this.id,
      title: title ?? this.title,
      content: content ?? this.content,
      author: author ?? this.author,
      imageUrl: imageUrl ?? this.imageUrl,
      date: date ?? this.date,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'content': content,
      'author': author,
      'imageUrl': imageUrl,
      'date': date,
    };
  }

  factory NewsDioModel.fromMap(Map<String, dynamic> map) {
    return NewsDioModel(
      // id: map['id'] as int,
      title: map['title'] != null ? map['title'] as String : '',
      content: map['content'] != null ? map['content'] as String : '',
      author: map['author'] != null ? map['author'] as String : '',
      imageUrl: map['urlToImage'] != null ? map['urlToImage'] as String : '',
      date: map['publishedAt'] != null ? map['publishedAt'] as String : '',
    );
  }

  String toJson() => json.encode(toMap());

  factory NewsDioModel.fromJson(String source) =>
      NewsDioModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'NewsDioModel(id: $id, title: $title, content: $content, author: $author, imageUrl: $imageUrl, date: $date)';
  }

  @override
  bool operator ==(covariant NewsDioModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.title == title &&
        other.content == content &&
        other.author == author &&
        other.imageUrl == imageUrl &&
        other.date == date;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        content.hashCode ^
        author.hashCode ^
        imageUrl.hashCode ^
        date.hashCode;
  }
}
