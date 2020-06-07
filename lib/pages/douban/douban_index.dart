import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemo/common/api.dart';
import 'package:flutterdemo/pages/douban/model/movie_item.dart';
import 'package:flutterdemo/pages/douban/widget/movie_grid_view.dart';
import 'package:flutterdemo/pages/douban/widget/toplist_banner.dart';

class DoubanIndex extends StatefulWidget {
  final Widget child;

  DoubanIndex({Key key, this.child}) : super(key: key);

  _DoubanIndexState createState() => _DoubanIndexState();
}

class _DoubanIndexState extends State<DoubanIndex>
    with AutomaticKeepAliveClientMixin {
  var nowPlayingList, comingList;

  @override
  void initState() {
    super.initState();
    fetchMovieData();
  }

  @override
  Widget build(BuildContext context) {
    if (nowPlayingList == null && comingList == null) {
      return new Center(
        child: new CupertinoActivityIndicator(),
      );
    } else
      return Scaffold(
          appBar: AppBar(
            brightness: Brightness.light,
            title: Text('豆瓣电影'),
            backgroundColor: Colors.white,
          ),
          body: Container(
            child: RefreshIndicator(
              onRefresh: fetchMovieData,
              child: ListView(
                addAutomaticKeepAlives: true,
                cacheExtent: 10000,
                children: <Widget>[
                  TopListBanner(),
                  MovieGridView(nowPlayingList, "影院热映", "fff"),
                  MovieGridView(comingList, "即将上映", "fff"),
                ],
              ),
            ),
          ));
  }

  Future<void> fetchMovieData() async {
    Api client = new Api();
    var response = await Future.wait([
      client.getDoubanMovies("in_theaters", 0, 6),
      client.getDoubanMovies("coming_soon", 0, 6)
    ]);
    print(response[1]);
    setState(() {
      nowPlayingList = formatMovieList(response[0]["subjects"]);
      comingList = formatMovieList(response[1]["subjects"]);
    });
  }

  List<MovieItem> formatMovieList(var list) {
    List content = list;
    List<MovieItem> movies = [];
    content.forEach((data) {
      movies.add(MovieItem.fromJson(data));
    });
    return movies;
  }

  @override
  bool get wantKeepAlive => true;
}
