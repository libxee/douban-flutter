import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemo/common/constant.dart';
import 'package:flutterdemo/util/screen.dart';

class TopListBannerItem extends StatelessWidget {
  final rankItem;
  const TopListBannerItem(this.rankItem);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(horizontal: 5.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.black12,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 8),
            blurRadius: 24,
            color: kShadowColor,
          ),
        ],
      ),
      child: new Container(
        child: Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: CachedNetworkImageProvider(
                      rankItem.rankCover??"https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2596104860.jpg"),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            Positioned(
              left: 0,
              top: 100,
              right: 0,
              bottom: 0,
              child: Opacity(
                opacity: 0.6,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color.fromARGB(0, 0, 0, 0),
                        Color.fromARGB(255, 0, 0, 0),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
                bottom: 0,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  width: Screen.width,
                  height: 100,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(rankItem.rankListName,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold)),
                      Text(
                        rankItem.refreshTime,
                        style: TextStyle(color: Colors.white),
                      ),

                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
