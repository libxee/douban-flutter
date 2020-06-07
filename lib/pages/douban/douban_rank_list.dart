import 'package:flutter/material.dart';

class DoubanRankList extends StatefulWidget {
  var arguments;
  DoubanRankList({Key key, this.arguments}) : super(key: key);
  @override
  _DoubanRankListState createState() => _DoubanRankListState();
}
class _DoubanRankListState extends State<DoubanRankList> {
  var arguments;
  @override
  void initState() {
    super.initState();
    arguments = widget.arguments;
    fetchRankList();
  }
  @override
  Widget build(BuildContext context) {
//    arguments = ModalRoute.of(context).settings.arguments;
    return Scaffold(
        appBar: AppBar(
      title: Text(arguments["rankListName"]),
      centerTitle: true,
    ));
  }
  Future<void> fetchRankList() async {
    print(arguments);
  }
}
