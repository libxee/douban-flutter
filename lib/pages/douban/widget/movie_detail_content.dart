import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemo/pages/douban/model/movie_detail.dart';
import 'package:flutterdemo/pages/douban/widget/movie_cover.dart';

class MovieContent extends StatelessWidget {
  final MovieDetail movieDetail;
  Color pageColor;
  MovieContent(this.movieDetail, this.pageColor);

  Widget _sectionTitle(String text) {
    return Container(
      child: Text(text,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          )),
    );
  }

  Widget _buildSummary() {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _sectionTitle("剧情简介"),
          Padding(padding: EdgeInsets.only(top: 10)),
          Text(
            movieDetail.summary,
            textAlign: TextAlign.justify,
            style: TextStyle(
              fontSize: 15,
              color: Colors.white,
            ),
          ),
        ]);
  }

  Widget _buildTags() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _sectionTitle("相关分类"),
        Padding(padding: EdgeInsets.only(top: 10)),
        Container(
          height: 30,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: movieDetail.tags.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(255, 255, 255, 0.2),
                        borderRadius: BorderRadius.all(Radius.circular(14))),
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 1, horizontal: 10),
                      child: Center(
                        child: Text(
                          movieDetail.tags[index],
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }),
        )
      ],
    );
  }

  Widget _buildCasts() {
    (movieDetail.directors?? []).map((e) => e["type"] = "导演");
    (movieDetail.casts ?? []).map((e) => e["type"] = "演员");
    List directorAndCast = [
      ...movieDetail.directors ?? [],
      ...movieDetail.casts ?? []
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _sectionTitle("演职员"),
        Padding(padding: EdgeInsets.only(top: 10)),
        Container(
          height: 180,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: directorAndCast.length,
              itemBuilder: (BuildContext context, int index) {
                var person = directorAndCast[index];
                print(person);
                return Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: Container(
                    child: GestureDetector(
                      onTap: () => {},
                      child: Container(
                        width: 100,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            MovieCoverImage(
                              person["avatars"] != null ? person["avatars"]["large"]:"http://img1.doubanio.com/view/celebrity/s_ratio_celebrity/public/p23269.jpg",
                              width: 100,
                              height: 140,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              person["name"],
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                              maxLines: 1,
                            ),
                            SizedBox(
                              height: 3,
                            ),
//                            Text(
//                              person["type"],
//                              overflow: TextOverflow.ellipsis,
//                              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
//                              maxLines: 1,
//                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }),
        )
      ],
    );
  }

  Widget _buildStills() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _sectionTitle("预告片/剧照"),
        Padding(padding: EdgeInsets.only(top: 10)),
        Container(
          height: 140,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: movieDetail.photos.length,
              itemBuilder: (BuildContext context, int index) {
                var photo = movieDetail.photos[index];
                return Padding(
                  padding: EdgeInsets.only(right: 6),
                  child: Container(
                    child: MovieCoverImage(
                      photo["thumb"],
                      width: 200,
                      height: 140,
                    ),
                  ),
                );
              }),
        )
      ],
    );
  }

  Widget _buildComments() {}
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      color: pageColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _buildTags(),
              Padding(padding: EdgeInsets.only(top: 36)),
              _buildSummary(),
              Padding(padding: EdgeInsets.only(top: 36)),
              _buildCasts(),
              Padding(padding: EdgeInsets.only(top: 36)),
              _buildStills(),
            ],
          ),
        ],
      ),
    );
  }
}
