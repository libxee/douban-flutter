import 'package:flutter/material.dart';

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
        appBar: AppBar(
      title:  Text(
        arguments["movieTitle"],
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
      ),
      centerTitle: true,
    ));
  }
}
