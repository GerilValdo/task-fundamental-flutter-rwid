import 'package:flutter/material.dart';

import '../../core/data/entity/news_dio_model.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final NewsDioModel news =
        ModalRoute.of(context)!.settings.arguments as NewsDioModel;
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 13),
        child: Column(
          spacing: 10,
          children: [
            Container(
              height: 230,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                      image: NetworkImage(news.imageUrl ??
                          'https://picsum.photos/id/41/200/300'),
                      fit: BoxFit.cover)),
            ),
            Text(
              news.title ?? '',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  flex: 1,
                  child: Text(
                    news.author ?? '',
                    maxLines: 3,
                    softWrap: true,
                    style: TextStyle(fontSize: 1, fontWeight: FontWeight.w500),
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Text(news.date ?? '',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w300)),
                ),
              ],
            ),
            Expanded(
              child: ListView(
                children: [
                  Text(
                    news.content ?? '',
                    textAlign: TextAlign.justify,
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
