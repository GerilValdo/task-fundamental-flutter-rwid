import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_flutter_rwid/core/data/entity/news_model.dart';
import '../news/bloc/news_bloc.dart';
import '../news/view/news_form.dart';
import '../news/view/news_card.dart';

class SavedPage extends StatefulWidget {
  const SavedPage({super.key});

  @override
  State<SavedPage> createState() => _SavedPageState();
}

class _SavedPageState extends State<SavedPage> {
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
                      context.read<NewsBloc>().add(DeleteNews(news.id));
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
    return Scaffold(
      appBar: AppBar(
        leading: SizedBox(),
        title: Text('Saved News'),
        centerTitle: true,
      ),
      body: BlocBuilder<NewsBloc, NewsState>(
        builder: (context, state) {
          return switch (state) {
            NewsLoading() => Center(
                child: CircularProgressIndicator(),
              ),
            NewsError() => Center(
                child: Text('Error'),
              ),
            NewsSuccess() => Padding(
                padding: EdgeInsets.all(15),
                child: ListView.builder(
                  itemCount: state.news.length,
                  itemBuilder: (context, index) {
                    final news = state.news[index];
                    return NewsCard(
                      news: news,
                      onLongPress: () => _onLongPress(context, news),
                    );
                  },
                ),
              ),
          };
        },
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
