import 'package:flutter/material.dart';
import 'package:task_flutter_rwid/core/data/entity/news_model.dart';
import 'package:task_flutter_rwid/main.dart';
import 'package:task_flutter_rwid/objectbox.g.dart';
import '../news/news_form.dart';
import 'package:objectbox/objectbox.dart';
import '../news/news_card.dart';

class SavedPage extends StatefulWidget {
  const SavedPage({super.key});

  @override
  State<SavedPage> createState() => _SavedPageState();
}

class _SavedPageState extends State<SavedPage> {
  Box<NewsModel> newsBox = objectbox.store.box<NewsModel>();

  void _refresh() {
    setState(() {});
  }

  void _onLongPress(BuildContext context, NewsModel news) async {
    await showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 8),
              child: Column(
                spacing: 10,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NewsForm(
                            titleAppBar: 'Edit News',
                            news: news,
                          ),
                        ),
                      ).then((value) => _refresh());
                    },
                    child: Text(
                      'Edit',
                      style: TextStyle(fontSize: 25),
                    ),
                  ),
                  Divider(
                    height: 0,
                  ),
                  InkWell(
                    onTap: () {
                      newsBox.remove(news.id);
                      Navigator.pop(context);
                      _refresh();
                    },
                    child: Text(
                      'Delete',
                      style: TextStyle(fontSize: 25),
                    ),
                  ),
                  Divider(
                    height: 0,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Cancel',
                      style: TextStyle(fontSize: 25),
                    ),
                  ),
                  Divider(
                    height: 0,
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    List<NewsModel> allNews = newsBox.getAll();
    return Scaffold(
      appBar: AppBar(
        leading: SizedBox(),
        title: Text('Saved News'),
        centerTitle: true,
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          _refresh();
        },
        child: allNews.isEmpty
            ? Center(
                child: Text('No Saved News'),
              )
            : Padding(
                padding: EdgeInsets.all(15),
                child: ListView.builder(
                  itemCount: allNews.length,
                  itemBuilder: (context, index) {
                    final news = allNews[index];
                    return NewsCard(
                      news: news,
                      onLongPress: () => _onLongPress(context, news),
                    );
                  },
                ),
              ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => NewsForm(
                titleAppBar: 'Add News',
              ),
            ),
          ).then((value) => _refresh());
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
