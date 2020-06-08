import 'package:flutter/material.dart';
import 'package:flutterdemo/pages/douban/widget/movie_detail_header.dart';
class DoubanMovieDetail extends StatefulWidget {
  final arguments;

  DoubanMovieDetail({Key key, this.arguments}) : super(key: key);

  @override
  _DoubanMovieDetailState createState() => _DoubanMovieDetailState();
}

class _DoubanMovieDetailState extends State<DoubanMovieDetail> {
  var arguments;

  @override
  void initState() {
    arguments = widget.arguments;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: CustomScrollView(
      slivers: <Widget>[
        SliverPersistentHeader(
          pinned: true,
          delegate: DetailHeader(
              title:arguments["movieTitle"],
              collapsedHeight: 50,
              expandedHeight: 320,
              paddingTop: MediaQuery.of(context).padding.top,
              coverImgUrl: 'http://image.wufazhuce.com/FnTZrZAil8kGLXhMc5lOXvW9zybF'
          ),
        ),
        SliverFillRemaining(
          child: Text("测试"),
        )
      ],
    ),);
  }

}

