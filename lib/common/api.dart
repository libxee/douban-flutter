import 'dart:io';
import 'package:dio/dio.dart';
import 'dart:async';
//
//import 'package:html/dom.dart' as dom;
//import 'package:html/parser.dart' show parse;
//import 'package:http/http.dart' as http;


class Api{

  static const oneListByMonth = "http://v3.wufazhuce.com:8000/api/hp/bymonth/"; //2019-08
  static const oneDetailById = "http://v3.wufazhuce.com:8000/api/onelist/"; //2554/0
  static Dio createDio() {
    return Dio();
  }
  var dio = createDio();
  Future<dynamic> getOneList(String date) async {
    Response<Map> response = await dio
        .get(oneListByMonth + date);
    return response.data;
  }
}
