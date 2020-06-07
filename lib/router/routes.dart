import 'package:flutter/material.dart';
import 'package:flutterdemo/components/bottom_navigation_widget.dart';
import 'package:flutterdemo/pages/douban/douban_movie_detail.dart';
import 'package:flutterdemo/pages/douban/douban_rank_list.dart';
import 'package:flutterdemo/pages/one/one_detail.dart';

final String home = "/";
final String movieRankList = "/movieRankList";
final String movieDetail = "/movieDetail";
final String oneDetail = "/oneDetail";
final mRoutes = {
  home: (context) => BottomNavigationWidget(),
  movieRankList: (context, {arguments}) => DoubanRankList(arguments: arguments),
  movieDetail: (context, {arguments}) =>
      DoubanMovieDetail(arguments: arguments),
  oneDetail: (context, {arguments}) => OneDetail(arguments: arguments),
};
// ignore: missing_return, top_level_function_literal_block
var onGenerateRoute = (RouteSettings settings) {
  final String name = settings.name;
  final Function pageContentBuilder = mRoutes[name];
  if (pageContentBuilder != null) {
    if (settings.arguments != null) {
      final Route route = MaterialPageRoute(
          builder: (context) =>
              pageContentBuilder(context, arguments: settings.arguments));
      return route;
    } else {
      final Route route =
          MaterialPageRoute(builder: (context) => pageContentBuilder(context));
      return route;
    }
  }
};
