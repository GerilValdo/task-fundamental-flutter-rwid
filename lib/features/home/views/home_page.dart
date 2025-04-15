import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:task_flutter_rwid/core/data/remote/dio/dio_repository.dart';
import '../bloc/news_api_bloc.dart';
import 'filter_content.dart';
import 'package:lottie/lottie.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Future<List<NewsDioModel>>? newsArticles;
  final _scrollController = ScrollController();

  @override
  void initState() {
    _scrollController.addListener(_onScroll);
    // final dioRepository = DioRepository();
    // newsArticles = dioRepository.getNews(page: 1);
    context.read<NewsApiBloc>().add(LoadNews());
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom) {
      context.read<NewsApiBloc>().add(LoadMoreNews());
    }
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }

  @override
  Widget build(BuildContext context) {
    double heightBody = MediaQuery.of(context).size.height;
    double widthBody = MediaQuery.of(context).size.width;
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
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: Lottie.asset('assets/lottie/animation_robot.json',
                          height: 100),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ListTile(
                          textColor: Colors.white,
                          title: Text('Welcome Back, Valdo!'),
                          subtitle: Text(
                              'Discover a world of news that matter to you'),
                          titleTextStyle: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
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
                trailing: TextButton(
                    onPressed: () {
                      // final dioRepository = DioRepository();
                      // setState(() {
                      //   newsArticles = dioRepository.getNews(page: 1);
                      // });
                    },
                    child: Text('See All')),
              ),
              Expanded(
                child: BlocBuilder<NewsApiBloc, NewsApiState>(
                  builder: (context, state) {
                    return switch (state) {
                      NewsLoading() => Center(
                          child: CircularProgressIndicator(),
                        ),
                      NewsError() => Center(child: Text(state.message)),
                      NewsSuccess() => ListView.builder(
                          controller: _scrollController,
                          padding: EdgeInsets.symmetric(horizontal: 5),
                          itemCount: state.hasReachedMax
                              ? state.news.length
                              : state.news.length + 1,
                          itemBuilder: (context, index) {
                            if (index >= state.news.length) {
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                            final news = state.news[index];
                            return InkWell(
                              onTap: () {
                                Navigator.pushNamed(context, '/detail-page',
                                    arguments: news);
                              },
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
                                child: Row(
                                  children: [
                                    Flexible(
                                      flex: 4,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            height: heightBody * 0.04,
                                            child: Chip(
                                              padding: EdgeInsets.zero,
                                              shape: RoundedRectangleBorder(
                                                  side: BorderSide(
                                                      color: Colors.blue),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20)),
                                              label: Text(
                                                news.author ?? '',
                                                overflow: TextOverflow.clip,
                                              ),
                                              labelStyle: TextStyle(
                                                  color: Colors.blue,
                                                  fontSize: 12),
                                            ),
                                          ),
                                          Text(
                                            news.title ?? '',
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            news.date ?? '',
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
                                        child: Image.network(
                                          news.imageUrl ??
                                              'https://picsum.photos/id/41/200/300',
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        )
                    };
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
