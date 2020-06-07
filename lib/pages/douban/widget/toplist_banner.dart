import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemo/pages/douban/model/rank_item.dart';
import 'package:flutterdemo/pages/douban/widget/toplist_banner_item.dart';

class TopListBanner extends StatefulWidget {
  @override
  _TopListBannerState createState() => _TopListBannerState();
}

// ignore: camel_case_types
class _TopListBannerState extends State<TopListBanner> {
  var rankList = [];

  @override
  void initState() {
//    top250 | weekly | new_movies| us_box
    rankList
      ..add(new RankItem(
          "实时热门榜",
          "https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2604517782.webp",
          "每小时更新一次",
          "new_movies"))
      ..add(new RankItem(
          "豆瓣电影Top250",
          "https://img3.doubanio.com/view/photo/s_ratio_poster/public/p480747492.jpg",
          "豆瓣榜单",
          "top250"))
      ..add(new RankItem(
          "一周口碑电影榜",
          "https://img9.doubanio.com/view/photo/s_ratio_poster/public/p2594916975.webp",
          "每周五更新",
          "weekly"))
      ..add(new RankItem(
          "欧美电影榜",
          "https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2600111343.webp",
          "每周五更新",
          "use_box"));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20, horizontal: 0),
      child: CarouselSlider(
        items: rankList.toList().map((item) {
          return Builder(
            builder: (BuildContext context) {
              return TopListBannerItem(item);
            },
          );
        }).toList(),
        options: CarouselOptions(
          height: 220,
          aspectRatio: 16 / 9,
          viewportFraction: 0.8,
          initialPage: 0,
          enableInfiniteScroll: true,
          reverse: false,
          autoPlay: true,
          autoPlayInterval: Duration(seconds: 3),
          autoPlayAnimationDuration: Duration(milliseconds: 800),
          autoPlayCurve: Curves.fastOutSlowIn,
          enlargeCenterPage: true,
          scrollDirection: Axis.horizontal,
          pauseAutoPlayOnTouch: true,
        ),
      ),
    );
  }
}
