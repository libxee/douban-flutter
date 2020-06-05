import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:transparent_image/transparent_image.dart';

class DoubanIndex extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("豆瓣"),),
      body: new Stack(
        children: <Widget>[
          new Center(child: new CircularProgressIndicator()),
          new Center(child: new FadeInImage.memoryNetwork(placeholder: kTransparentImage, image: "http://image.wufazhuce.com/Fi8XSRZCdEi-67YEpZAPF0KRsr6X"),)
        ],
      )
    );
  }
}