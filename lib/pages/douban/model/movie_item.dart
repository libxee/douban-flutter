import 'package:json_annotation/json_annotation.dart';

part 'movie_item.g.dart';

@JsonSerializable()
class MovieItem {
  MovieItem();

  Map<String, dynamic> rating;
  List genres;
  String title;
  List casts;
  List durations;
  num collect_count;
  String mainland_pubdate;
  bool has_video;
  String original_title;
  String subtype;
  List directors;
  List pubdates;
  String year;
  Map<String, dynamic> images;
  String alt;
  String id;

  factory MovieItem.fromJson(Map<String, dynamic> json) =>
      _$MovieItemFromJson(json);

  Map<String, dynamic> toJson() => _$MovieItemToJson(this);
}
