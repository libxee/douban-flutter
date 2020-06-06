import 'package:flutter/material.dart';
import 'package:flutterdemo/pages/douban/model/movie_item.dart';
import 'package:flutterdemo/pages/douban/widget/movie_item_view.dart';
import 'package:flutterdemo/pages/douban/widget/section_view.dart';

class MovieGridView extends StatelessWidget {
  final List<MovieItem> movies;
  final String title;
  final String action;

  MovieGridView(this.movies, this.title, this.action);

  @override
  Widget build(BuildContext context) {
    List<MovieItem> thumbMovies;
    var children;
    switch (title) {
//      可区分电影卡片类型；
      case '影院热映':
        children = movies.map((movie) => MovieItemView(movie)).toList();
        break;
      case '即将上映':
        children = movies.map((movie) => MovieItemView(movie)).toList();
        break;
      default:
        break;
    }

    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SectionView(title, action),
          Container(
            padding: EdgeInsets.fromLTRB(15, 10, 0, 10),
            child: Wrap(
              spacing: 15,
              runSpacing: 20,
              children: children,
            ),
          ),
          Container(
            height: 10,
            color: Color(0xFFF5F5F5),
          )
        ],
      ),
    );
  }
}
