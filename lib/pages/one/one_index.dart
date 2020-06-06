import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemo/common/api.dart';
import 'package:flutterdemo/pages/one/widget/one_item.dart';

import 'model/oneItem.dart';

class OneIndex extends StatefulWidget {
  final String title;
  const OneIndex({Key key, this.title}) : super(key: key);
  @override
  _OneIndexState createState() => _OneIndexState(title);
}

class _OneIndexState extends State<OneIndex> {
  String title;
  List<OneItem> oneList;
  bool _isLoading = false;
  bool _hasMore = true;
  String currentDate;
  ScrollController _scrollController = ScrollController();
  _OneIndexState(this.title);
  @override
  void initState() {
    super.initState();
    currentDate = getCurrentMonth();
    fetchData(currentDate);
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent) {
//        滑动到最底部
        print("reach the bottom");
        fetchData(currentDate);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("一个图文"),
//          backgroundColor: Colors.white,
        ),
        body: _buildBody());
  }

  Widget _buildBody() {
    if (oneList == null) {
      return Center(child: CupertinoActivityIndicator());
    }
    return Container(
      child: ListView.builder(
        itemCount: oneList.length,
        itemBuilder: (BuildContext context, int index) {
          if (index + 1 == oneList.length) {
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
          return OneItemView(oneList[index]);
        },
        controller: _scrollController,
      ),
    );
  }

  Future<void> fetchData(String date) async {
    if (!_hasMore || _isLoading) {
      return;
    }
    if (oneList == null) {
      oneList = [];
    }
    Api apiClient = new Api();
    _isLoading = true;
    var data;
    data = await apiClient.getOneList(date);
    print(data);
    _isLoading = false;
    if (data["res"] == 0) {
      setState(() {
        currentDate = getPrevMonth(currentDate);
        List<OneItem> newOneList = formatOneList(data["data"]);
        if(newOneList.length == 0){ _hasMore = false;}
        newOneList.forEach((element) {
          oneList.add(element);
        });
      });
    }
  }

  List<OneItem> formatOneList(var list) {
    List content = list;
    List<OneItem> items = [];
    content.forEach((element) {
      items.add(OneItem.fromJson(element));
    });
    return items;
  }

  String getCurrentMonth() {
    DateTime now = DateTime.now();
    int year = now.year;
    int month = now.month;
    String currentDate = "${year}-${month}";
    return currentDate;
  }
  String getPrevMonth(String currentDate) {
    List<String> dataArr = currentDate.split("-");
    int year = int.parse(dataArr[0]);
    int month = int.parse(dataArr[1]);
    DateTime passTime = DateTime(year, month - 1);
    int curYear = passTime.year;
    int prevMonth = passTime.month;
    String prevDate = "${curYear}-${prevMonth}";
    return prevDate;
  }
  @override
  void dispose() {
    super.dispose();
    this._scrollController.dispose();
  }
}
