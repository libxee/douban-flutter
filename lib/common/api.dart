import 'dart:async';

import 'package:dio/dio.dart';

//
//import 'package:html/dom.dart' as dom;
//import 'package:html/parser.dart' show parse;
//import 'package:http/http.dart' as http;

class Api {
  static const oneListByMonth =
      "http://v3.wufazhuce.com:8000/api/hp/bymonth/"; //2019-08
  static const oneDetailById =
      "http://v3.wufazhuce.com:8000/api/onelist/"; //2554/0
  static const doubanMovies = "https://douban.uieee.com/v2/movie/";

  static Dio createDio() {
    return Dio();
  }

  var dio = createDio();

  Future<dynamic> getOneList(String date) async {
    Response<Map> response = await dio.get(oneListByMonth + date);
    return response.data;
  }

// type: coming_soon | in_theaters | top250 | weekly | new_movies| us_box
//  start: num
//  count: num
  Future<dynamic> getDoubanMovies(String type, int start, int count) async {
    Response<Map> response = await dio.get(doubanMovies + type,
        queryParameters: {"count": count ?? 20, "start": start ?? 0});
    return response.data;
  }
}
