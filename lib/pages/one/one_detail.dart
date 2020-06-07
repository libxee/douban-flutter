import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemo/pages/one/model/oneItem.dart';

class OneDetail extends StatefulWidget {
  final arguments;

  OneDetail({Key key, this.arguments}) : super(key: key);

  @override
  _OneDetailState createState() => _OneDetailState();
}

class _OneDetailState extends State<OneDetail> {
  var arguments;
  @override
  void initState() {
    arguments = widget.arguments;
    print(arguments);
    super.initState();
  }

  formatDate(String dateStr) {
    var date = DateTime.parse(dateStr);
    int year = date.year;
    int month = date.month;
    int day = date.day;
    return {"year": year, "month": month, "day": day};
  }

  @override
  Widget build(BuildContext context) {
    OneItem oneItem = arguments["oneItem"];
    var date = formatDate(oneItem.maketime);

    return Scaffold(
        appBar: AppBar(
          title: Text("一个图文"),
          centerTitle: true,
        ),
        body: Column(
          children: <Widget>[
            Container(
        constraints:  BoxConstraints(
            minWidth: double.infinity, //宽度尽可能大
            minHeight: 200.0 //最小高度为50像素
        ),//卡片大小
              child: new Center(

                child: new CachedNetworkImage(
                  imageUrl: oneItem.hp_img_url,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 20, horizontal: 18),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    oneItem.hp_title,
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    oneItem.hp_author,
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20, bottom: 10),
              child: Column(
                children: <Widget>[
                  Text(date["day"].toString(),
                      style: TextStyle(
                        fontSize: 48,
                        fontFamily: "Serif",
                        color: Colors.black,
                      )),
                  Text("${date["month"]} / ${date["year"]}",
                      style: TextStyle(
                        fontSize: 14,
                        height: 2,
                        fontFamily: "Serif",
                        color: Colors.black,
                      )),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 20, horizontal: 18),
              child:  Text(oneItem.hp_content,
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: "Serif",
                    color: Colors.black,
                  )),
            )
          ],
        ));
  }
}
