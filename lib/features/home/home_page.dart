import 'package:flutter/material.dart';
import '../../core/models/news_articles.dart';
import './widgets/filter_content.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    double heightBody = MediaQuery.of(context).size.height;
    double widthBody = MediaQuery.of(context).size.width;
    var newsArticles = NewsArticles().newsArticles;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            children: [
              Container(
                height: heightBody * 0.17,
                width: widthBody,
                padding: EdgeInsets.symmetric(vertical: 10),
                alignment: Alignment.bottomLeft,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [Colors.blue.shade400, Colors.blue.shade300]),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: ListTile(
                  textColor: Colors.white,
                  title: Text('Welcome Back, Valdo!'),
                  subtitle: Text('Discover a world of news that matter to you'),
                  titleTextStyle:
                      TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: heightBody * 0.01),
              FilterContent(),
              ListTile(
                title: Text('Lastest News'),
                titleTextStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.black),
                trailing: TextButton(onPressed: () {}, child: Text('See All')),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 7,
                      child: Padding(
                        padding: EdgeInsets.all(15),
                        child: Row(
                          children: [
                            Flexible(
                              flex: 4,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: heightBody * 0.04,
                                    child: Chip(
                                      padding: EdgeInsets.zero,
                                      shape: RoundedRectangleBorder(
                                          side: BorderSide(color: Colors.blue),
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      label: Text(
                                          newsArticles[index]['category']!),
                                      labelStyle: TextStyle(
                                          color: Colors.blue, fontSize: 12),
                                    ),
                                  ),
                                  Text(
                                    newsArticles[index]['title']!,
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    newsArticles[index]['date']!,
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
                                height: 100,
                                color: Colors.black12,
                                alignment: Alignment.center,
                                child: Image.asset(
                                  'assets/image/image_article.jpg',
                                  fit: BoxFit.contain,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
