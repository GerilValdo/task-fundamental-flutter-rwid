import 'dart:io';

import 'package:flutter/material.dart';
import 'package:task_flutter_rwid/core/data/entity/news_model.dart';
import 'package:intl/intl.dart';

class NewsCard extends StatelessWidget {
  final NewsModel news;
  final void Function()? onLongPress;

  const NewsCard({
    super.key,
    required this.news,
    this.onLongPress,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: onLongPress,
      child: Card(
        elevation: 7,
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                flex: 4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      child: Chip(
                        padding: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(
                            side: BorderSide(color: Colors.blue),
                            borderRadius: BorderRadius.circular(20)),
                        label: Text(news.category ?? ''),
                        labelStyle: TextStyle(color: Colors.blue, fontSize: 12),
                      ),
                    ),
                    Text(
                      news.title ?? '',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      DateFormat('dd MMMM yyyy').format(news.date!.toLocal()),
                      style: TextStyle(
                        fontSize: 11,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 10),
              Flexible(
                flex: 3,
                child: Container(
                  color: Colors.black12,
                  height: 100,
                  alignment: Alignment.center,
                  child: news.imageUrl != null
                      ? Image.file(
                          File(news.imageUrl!),
                          fit: BoxFit.contain,
                        )
                      : Image.asset(
                          'assets/image/image_article.jpg',
                          fit: BoxFit.contain,
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
