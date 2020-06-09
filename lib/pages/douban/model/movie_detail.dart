import 'package:json_annotation/json_annotation.dart';

part 'movie_detail.g.dart';

@JsonSerializable()
class MovieDetail {
    MovieDetail();

    Map<String,dynamic> rating;
    num reviews_count;
    List videos;
    num wish_count;
    String original_title;
    List blooper_urls;
    num collect_count;
    Map<String,dynamic> images;
    String douban_site;
    String year;
    List popular_comments;
    String alt;
    String id;
    String mobile_url;
    num photos_count;
    String pubdate;
    String title;
    String do_count;
    bool has_video;
    String share_url;
    String seasons_count;
    List languages;
    String schedule_url;
    List writers;
    List pubdates;
    String website;
    List tags;
    bool has_schedule;
    List durations;
    List genres;
    String collection;
    List trailers;
    String episodes_count;
    List trailer_urls;
    bool has_ticket;
    List bloopers;
    List clip_urls;
    String current_season;
    List casts;
    List countries;
    String mainland_pubdate;
    List photos;
    String summary;
    List clips;
    String subtype;
    List directors;
    num comments_count;
    List popular_reviews;
    num ratings_count;
    List aka;
    
    factory MovieDetail.fromJson(Map<String,dynamic> json) => _$MovieDetailFromJson(json);
    Map<String, dynamic> toJson() => _$MovieDetailToJson(this);
}
