import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterdemo/pages/douban/model/movie_detail.dart';
import 'package:flutterdemo/util/screen.dart';

import 'movie_cover.dart';

class DetailHeader extends SliverPersistentHeaderDelegate {
  final double collapsedHeight;
  final double expandedHeight;
  final double paddingTop;
  final String title;
  final Color pageColor;
  final MovieDetail movieDetail;
  String statusBarMode = 'dark';

  DetailHeader({
    this.collapsedHeight,
    this.expandedHeight,
    this.paddingTop,
    this.title,
    this.pageColor,
    this.movieDetail,
  });

  @override
  double get minExtent => this.collapsedHeight + this.paddingTop;

  @override
  double get maxExtent => this.expandedHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }

  void updateStatusBarBrightness(shrinkOffset) {
    if (shrinkOffset > 50 && this.statusBarMode == 'dark') {
      this.statusBarMode = 'light';
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.light,
      ));
    } else if (shrinkOffset <= 50 && this.statusBarMode == 'light') {
      this.statusBarMode = 'dark';
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark,
      ));
    }
  }

  Color makeStickyHeaderBgColor(shrinkOffset) {
    final int alpha = (shrinkOffset / (this.maxExtent - this.minExtent) * 255)
        .clamp(0, 255)
        .toInt();
    return Color.fromARGB(
        alpha, pageColor.red, pageColor.green, pageColor.blue);
  }

  Color makeStickyHeaderTextColor(shrinkOffset, isIcon) {
    if (shrinkOffset <= 50) {
      return isIcon ? Colors.white : Colors.transparent;
    } else {
      final int alpha = (shrinkOffset / (this.maxExtent - this.minExtent) * 255)
          .clamp(0, 255)
          .toInt();
      return Color.fromARGB(alpha, 255, 255, 255);
    }
  }

  String list2String(List list) {
    StringBuffer sb = new StringBuffer();
    list.forEach((item) {
      sb.write(' $item ');
    });
    return sb.toString();
  }

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    this.updateStatusBarBrightness(shrinkOffset);
    return Container(
      height: this.maxExtent,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
              child: Image.network(movieDetail.photos[0]["thumb"],
                  fit: BoxFit.cover)),
          Positioned(
            left: 0,
            top: 0,
            right: 0,
            bottom: 0,
            child: Container(
              decoration: BoxDecoration(
                  color: Color.fromRGBO(
                      pageColor.red, pageColor.green, pageColor.blue, 0.6)),
            ),
          ),
          Positioned(
            left: 16,
            bottom: 30,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: MovieCoverImage(
                    movieDetail.images["large"],
                    width: 130,
                    height: 180,
                  ),
                ),
                Padding(padding: EdgeInsets.only(left: 16)),
                Container(
                  width: Screen.width - 180,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        movieDetail.title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(top: 6)),
                      Text(
                        "${movieDetail.original_title} (${movieDetail.year})",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(top: 8)),
                      Text(
                        "${list2String(movieDetail.genres)} / ${list2String(movieDetail.durations)}",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(top: 4)),
                      Text(
                        '上映时间：${list2String(movieDetail.pubdates)}',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(top: 4)),
                      Text(
                        '${movieDetail.collect_count}人看过 / ${movieDetail.wish_count}人想看',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            child: Container(
              color: this.makeStickyHeaderBgColor(shrinkOffset),
              child: SafeArea(
                bottom: false,
                child: Container(
                  height: this.collapsedHeight,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: this
                              .makeStickyHeaderTextColor(shrinkOffset, true),
                        ),
                        onPressed: () => Navigator.pop(context),
                      ),
                      Text(
                        movieDetail.title,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: this
                              .makeStickyHeaderTextColor(shrinkOffset, false),
                        ),
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.share,
                          color: this
                              .makeStickyHeaderTextColor(shrinkOffset, true),
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
