import 'package:flutter/material.dart';
import 'package:flutterdemo/pages/douban/screens/index/douban_index.dart';
import 'package:flutterdemo/pages/mine/mine_index.dart';
import 'package:flutterdemo/pages/one/one_index.dart';
import 'package:flutterdemo/pages/toutiao/screens/toutiao_index/toutiao_index.dart';
class BottomNavigationWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => BottomNavigationWidgetState();
}

class BottomNavigationWidgetState extends State<BottomNavigationWidget>
    with SingleTickerProviderStateMixin {
  final _bottomNavigationColor = Colors.blue;
  int _currentIndex = 0;
  List<Widget> list = List();
  var _controller = PageController(
    initialPage: 0,
  );

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  void initState() {
    list..add(ToutiaoIndex())..add(DoubanIndex())..add(OneIndex())..add(MineIndex());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      body: list[_currentIndex],
      body: PageView(
        controller: _controller,
        children: <Widget>[
          ToutiaoIndex(),
          DoubanIndex(),
          OneIndex(),
          MineIndex(),
        ],
        physics: NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
//          onTap: (index)=> _controller.animateToPage(index, duration: Duration(milliseconds: 500), curve: Curves.fastOutSlowIn),
        onTap: (index) {
          _controller.jumpToPage(index);
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.movie,
                color: _bottomNavigationColor,
              ),
              title:
              Text('头条', style: TextStyle(color: _bottomNavigationColor))),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.movie,
                color: _bottomNavigationColor,
              ),
              title:
                  Text('豆瓣', style: TextStyle(color: _bottomNavigationColor))),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.library_books,
                color: _bottomNavigationColor,
              ),
              title: Text(
                '一个',
                style: TextStyle(color: _bottomNavigationColor),
              )),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                color: _bottomNavigationColor,
              ),
              title: Text(
                '我的',
                style: TextStyle(color: _bottomNavigationColor),
              )),
        ],
      ),
    );
  }
}
