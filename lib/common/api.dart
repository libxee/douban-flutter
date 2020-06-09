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
  static const doubanMovieDetail = "http://api.douban.com/v2/movie/subject/";
  static const doubanApiKey = "0b2bdeda43b5688921839c8ecb20399b";

/*  短评
  url：https://api.douban.com/v2/movie/subject/ + 电影 id + /reviews

  拼接参数：

  apikey：略，同上映
  count：返回短评数量
  client：略，同上映
  udid：略，同上映
  start：从第多少个开始
  */

/*  影评
  url：https://api.douban.com/v2/movie/subject/26865690/comments

  拼接参数：

  apikey：略，同上映
  count：返回影评数量
  client：略，同上映
  udid：略，同上映*/
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
    print(start);
    Response<Map> response =
        await dio.get(doubanMovies + type, queryParameters: {
      "start": start,
      "count": count,
    });
    print(response);
    return response.data;
  }

  Future<dynamic> getDoubanMovieDetail(String movieId) async {
    Response<Map> response =
        await dio.get("$doubanMovieDetail$movieId", queryParameters: {
          "apikey": doubanApiKey
        });
    print(response);
    return response.data;
  }
}
