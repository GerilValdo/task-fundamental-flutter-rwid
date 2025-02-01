import 'package:flutter/material.dart';
import '../../../core/models/news_articles.dart';

class FilterContent extends StatefulWidget {
  const FilterContent({
    super.key,
  });
  @override
  State<FilterContent> createState() => _FilterContentState();
}

class _FilterContentState extends State<FilterContent> {
  var newsArticles = NewsArticles().newsArticles;
  int _selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor:
                    _selectedIndex == -1 ? Colors.white : Colors.blue,
                backgroundColor:
                    _selectedIndex == -1 ? Colors.blue : Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                  side: BorderSide(
                    width: 1,
                    color: Colors.blue,
                  ),
                ),
              ),
              onPressed: () {
                setState(() {
                  _selectedIndex = -1;
                });
              },
              child: Text("All"),
            ),
          ),
          ...List.generate(
            6,
            (index) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor:
                          _selectedIndex == index ? Colors.white : Colors.blue,
                      backgroundColor:
                          _selectedIndex == index ? Colors.blue : Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: BorderSide(
                          width: 1,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        _selectedIndex = index;
                      });
                    },
                    child: Text(newsArticles[index]['category']!)),
              );
            },
          )
        ],
      ),
    );
  }
}
