import 'package:flutter/material.dart';
import 'package:flutterdemo/common/constant.dart';
import 'package:flutterdemo/pages/douban/model/movie_item.dart';
import 'package:flutterdemo/pages/douban/widget/movie_cover.dart';

class RankItemView extends StatelessWidget {
  MovieItem movie;
  RankItemView(this.movie);
  @override
  Widget build(BuildContext context) {
    double imgWidth = 100;
    double height = imgWidth / 0.7;
    double spaceWidth = 15;
    double actionWidth = 60;
    String actor2String(List actors) {
      StringBuffer sb = new StringBuffer();
      actors.forEach((actor) {
        sb.write(' ${actor["name"]} ');
      });
      return sb.toString();
    }

    String genres2String(List genres) {
      StringBuffer sb = new StringBuffer();
      genres.forEach((genre) {
        sb.write(' $genre ');
      });
      return sb.toString();
    }

    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, "/movieDetail",
            arguments: {"movieId": movie.id, "movieTitle": movie.title});
      },
      child: Container(
        padding: EdgeInsets.fromLTRB(spaceWidth, spaceWidth, 0, spaceWidth),
        decoration: BoxDecoration(
            border:
                Border(bottom: BorderSide(color: kDeviderColor, width: 0.5)),
            color: Colors.white),
        child: Row(
          children: <Widget>[
            MovieCoverImage(
              movie.images["small"],
              width: imgWidth,
              height: height,
            ),
            Expanded(
              flex: 1,
              child: Container(
                padding: EdgeInsets.fromLTRB(spaceWidth, 0, spaceWidth, 0),
                height: height,
//              width: Screen.width - imgWidth - spaceWidth * 2 - actionWidth,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      movie.title,
                      style: TextStyle(
                        color: kTitleTextColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "${movie.rating["average"]}分",
                          style: TextStyle(color: Colors.grey, fontSize: 12.0),
                        ),
                        SizedBox(
                          width: 2,
                        ),
                        Text(
                          "（${movie.collect_count}人评价）",
                          style: TextStyle(color: Colors.grey, fontSize: 12.0),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      '${movie.year} /${genres2String(movie.genres)}/${actor2String(movie.directors)}/${actor2String(movie.casts)}',
                      style: TextStyle(color: Colors.grey, fontSize: 14),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    )
                  ],
                ),
              ),
            ),
            Container(
              width: actionWidth,
              height: height,
            ),
          ],
        ),
      ),
    );
  }
}
