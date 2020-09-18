
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ToutiaoIndex extends StatefulWidget {
  @override
  _ToutiaoIndexState createState() => _ToutiaoIndexState();
}
class _ToutiaoIndexState extends State<ToutiaoIndex> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    if ( false) {
      return new Center(
        child: new CupertinoActivityIndicator(),
      );
    } else
      return Scaffold(
          appBar: AppBar(
            brightness: Brightness.light,
            title: Text('明日头条'),
            backgroundColor: Colors.white,
          ),
          body: Center(
            child: Text('明日头条',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
          ));
  }
  @override
  bool get wantKeepAlive => true;
}
