import 'dart:io';

import 'package:flutter/material.dart';
import 'package:task_flutter_rwid/core/data/entity/news_model.dart';
import 'package:intl/intl.dart';

class NewsCard extends StatefulWidget {
  final NewsModel news;
  final void Function()? onLongPress;

  const NewsCard({
    super.key,
    required this.news,
    this.onLongPress,
  });

  @override
  State<NewsCard> createState() => _NewsCardState();
}

class _NewsCardState extends State<NewsCard> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => setState(() {
        isExpanded = !isExpanded;
      }),
      onLongPress: widget.onLongPress,
      child: Container(
        margin: EdgeInsets.only(bottom: 13),
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
            color: Colors.white60,
            boxShadow: [
              BoxShadow(
                  blurRadius: 3,
                  color: Colors.black12,
                  offset: Offset(0, 6),
                  spreadRadius: 3)
            ],
            borderRadius: BorderRadius.circular(15)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
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
                          label: Text(widget.news.category ?? ''),
                          labelStyle:
                              TextStyle(color: Colors.blue, fontSize: 12),
                        ),
                      ),
                      Text(
                        widget.news.title ?? '',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        DateFormat('dd MMMM yyyy')
                            .format(widget.news.date!.toLocal()),
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
                    child: widget.news.imageUrl != null
                        ? Image.file(
                            File(widget.news.imageUrl!),
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
            AnimatedContainer(
              duration: Duration(seconds: 1),
              height: isExpanded ? 60 : 0,
              child: Text(
                widget.news.content ?? '',
                maxLines: 3,
                style: TextStyle(overflow: TextOverflow.ellipsis),
              ),
            )
          ],
        ),
      ),
    );
  }
}
