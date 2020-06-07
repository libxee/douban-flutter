import 'package:json_annotation/json_annotation.dart';

part 'oneItem.g.dart';

@JsonSerializable()
class OneItem {
  String hpcontent_id;
  String hp_title;
  String author_id;
  String hp_img_url;
  String hp_img_original_url;
  String hp_author;
  String ipad_url;
  String hp_content;
  String hp_makettime;
  String last_update_date;
  String web_url;
  String wb_img_url;
  String image_authors;
  String text_authors;
  String image_from;
  String text_from;
  String content_bgcolor;
  String template_category;
  String maketime;
  int praisenum;
  int sharenum;
  int commentnum;

  OneItem(
      this.hpcontent_id,
      this.hp_title,
      this.author_id,
      this.hp_img_url,
      this.hp_img_original_url,
      this.hp_author,
      this.ipad_url,
      this.hp_content,
      this.hp_makettime,
      this.last_update_date,
      this.web_url,
      this.wb_img_url,
      this.image_authors,
      this.text_authors,
      this.image_from,
      this.text_from,
      this.content_bgcolor,
      this.template_category,
      this.maketime,
      this.praisenum,
      this.sharenum,
      this.commentnum);

  factory OneItem.fromJson(Map<String, dynamic> json) =>
      _$OneItemFromJson(json);

  Map<String, dynamic> toJson() => _$OneItemToJson(this);
}
