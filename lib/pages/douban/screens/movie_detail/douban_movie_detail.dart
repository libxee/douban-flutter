import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemo/common/api.dart';
import 'package:flutterdemo/pages/douban/model/movie_detail.dart';
import 'package:flutterdemo/pages/douban/screens/movie_detail/movie_detail_content.dart';
import 'package:flutterdemo/pages/douban/screens/movie_detail/movie_detail_header.dart';
import 'package:palette_generator/palette_generator.dart';

class DoubanMovieDetail extends StatefulWidget {
  final arguments;

  DoubanMovieDetail({Key key, this.arguments}) : super(key: key);

  @override
  _DoubanMovieDetailState createState() => _DoubanMovieDetailState();
}

class _DoubanMovieDetailState extends State<DoubanMovieDetail> {
  var arguments;
  MovieDetail movieDetail;
  Color pageColor = Colors.white;
  @override
  void initState() {
    arguments = widget.arguments;
    fetchMovieDetail(arguments["movieId"]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (movieDetail == null ) {
      return Center(child: CupertinoActivityIndicator());
    }
    return Scaffold(
      backgroundColor: pageColor,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverPersistentHeader(
            pinned: true,
            delegate: DetailHeader(
              title: arguments["movieTitle"],
              collapsedHeight: 50,
              expandedHeight: 300,
              paddingTop: MediaQuery.of(context).padding.top,
              pageColor: pageColor,
              movieDetail: movieDetail,
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: <Widget>[
                MovieContent(movieDetail, pageColor),
              ],
            ),
          )
        ],
      ),
    );
  }

  Future<void> fetchMovieDetail(String movieId) async {
    Api client = new Api();
    var response = await client.getDoubanMovieDetail(movieId);
    PaletteGenerator paletteGenerator =
        await PaletteGenerator.fromImageProvider(
      CachedNetworkImageProvider(response["images"]["small"]),
    );
    setState(() {
      movieDetail = MovieDetail.fromJson(response);
      if (paletteGenerator.darkVibrantColor != null) {
        pageColor = paletteGenerator.darkVibrantColor.color;
      } else {
        pageColor = Color(0xff35374c);
      }
      print(movieDetail.toString());
    });
  }
}
