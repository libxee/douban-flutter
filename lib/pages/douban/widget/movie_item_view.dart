import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemo/pages/douban/model/movie_item.dart';
import 'package:flutterdemo/util/screen.dart';

import 'movie_cover.dart';

class MovieItemView extends StatelessWidget {
  final MovieItem movie;

  MovieItemView(this.movie);

  tapMovie(context) {
    Navigator.pushNamed(context, "/movieDetail",
        arguments: {"movieId": movie.id, "movieTitle": movie.title});
  }

  @override
  Widget build(BuildContext context) {
    var width = (Screen.width - 15 * 4) / 3;
    return GestureDetector(
      onTap: () => {tapMovie(context)},
      child: Container(
        width: width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            MovieCoverImage(
              movie.images["small"],
              width: width,
              height: width / 0.75,
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              movie.title,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              maxLines: 1,
            ),
            SizedBox(
              height: 3,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  "评分:",
                  style: TextStyle(
                      color: Colors.amber,
                      fontWeight: FontWeight.bold,
                      fontSize: 12.0),
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  movie.rating["average"].toString(),
                  style: TextStyle(color: Colors.grey, fontSize: 12.0),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
