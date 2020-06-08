import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemo/common/api.dart';
import 'package:flutterdemo/pages/douban/widget/toplist_rank_item.dart';

import 'model/movie_item.dart';

class DoubanRankList extends StatefulWidget {
  var arguments;

  DoubanRankList({Key key, this.arguments}) : super(key: key);

  @override
  _DoubanRankListState createState() => _DoubanRankListState();
}

class _DoubanRankListState extends State<DoubanRankList> {
  var arguments;
  var rankList = [];
  var newRankList = [];
  bool _hasMore = true;
  int _movieStart = 0;
  final int _count = 20;
  int _currentCount = 0;
  String _rankType = "";
  bool _isLoading = false;
  ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    arguments = widget.arguments;
    _rankType = arguments["rankType"];
    print(_rankType);
    fetchRankList(_rankType, _movieStart);
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent) {
        print("reach the bottom");
        fetchRankList(_rankType, _movieStart);
      }
    });
  }

  Widget _buildBody() {
    if (rankList.length == 0 && _hasMore) {
      return Center(child: CupertinoActivityIndicator());
    } else
      return Container(
        child: ListView.builder(
          itemCount: rankList.length,
          itemBuilder: (BuildContext context, int index) {
            if (index + 1 == rankList.length) {
              return Container(
                padding: EdgeInsets.all(10),
                child: Center(
                  child: Offstage(
                    offstage: !_hasMore,
                    child: CupertinoActivityIndicator(),
                  ),
                ),
              );
            }
            return RankItemView(rankList[index]);
          },
          controller: _scrollController,
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
//    arguments = ModalRoute.of(context).settings.arguments;
    return Scaffold(
        appBar: AppBar(
          title: Text(arguments["rankListName"]),
          centerTitle: true,
        ),
        body: _buildBody());
  }

  Future<void> fetchRankList(String type, int start) async {
    if (!_hasMore || _isLoading) {
      return;
    }
    Api client = new Api();
    _isLoading = true;
    var response = await client.getDoubanMovies(type, start, _count);
    setState(() {
      _isLoading = false;
      _currentCount = _currentCount + response["subjects"].length;
      int total = response["total"] ?? 0;
      if (total > _currentCount) {
        _hasMore = true;
        _movieStart = _currentCount;
      } else {
        _hasMore = false;
      }
      newRankList = formatMovieList(response["subjects"]);
      newRankList.forEach((element) {
        print(element.title);
        rankList.add(element);
      });
    });
  }

  List<MovieItem> formatMovieList(var list) {
    List content = list;
    List<MovieItem> movies = [];
    if (_rankType == "weekly" || _rankType == "us_box") {
      content.forEach((data) {
        movies.add(MovieItem.fromJson(data["subject"]));
      });
    } else {
      content.forEach((data) {
        movies.add(MovieItem.fromJson(data));
      });
    }
    return movies;
  }

  @override
  void dispose() {
    super.dispose();
    this._scrollController.dispose();
  }
}
