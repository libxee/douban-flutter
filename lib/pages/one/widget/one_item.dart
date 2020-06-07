import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemo/pages/one/model/oneItem.dart';

class OneItemView extends StatelessWidget {
  final OneItem oneItem;

  const OneItemView(this.oneItem);

  Widget renderCover() {
    return Stack(
      fit: StackFit.passthrough,
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(8),
            topRight: Radius.circular(8),
          ),
          child: Image.network(
            oneItem.hp_img_url,
            height: 200,
            fit: BoxFit.fitWidth,
          ),
        ),
        Positioned(
          left: 0,
          top: 100,
          right: 0,
          bottom: 0,
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromARGB(0, 0, 0, 0),
                  Color.fromARGB(80, 0, 0, 0),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget renderInfo() {
    return Container(
        padding: EdgeInsets.all(20.0), //容器内补白
        child: Column(
          children: <Widget>[
            Text(
              oneItem.hp_author,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Color(0xFF808080),
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 8)),
            Text(
              oneItem.hp_content,
              style: TextStyle(
                fontSize: 14,
                color: Color(0xFF808080),
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 8)),
            Text(
              oneItem.text_authors,
              style: TextStyle(
                fontSize: 14,
                color: Color(0xFF808080),
              ),
            ),
          ],
        ));
  }

  Widget renderInteractionArea() {
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              Icon(
                Icons.favorite,
                size: 16,
                color: Color(0xFF999999),
              ),
              Padding(padding: EdgeInsets.only(left: 6)),
              Text(
                oneItem.praisenum.toString(),
                style: TextStyle(
                  fontSize: 15,
                  color: Color(0xFF999999),
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Icon(
                Icons.share,
                size: 16,
                color: Color(0xFF999999),
              ),
              Padding(padding: EdgeInsets.only(left: 6)),
              Text(
                oneItem.sharenum.toString(),
                style: TextStyle(
                  fontSize: 15,
                  color: Color(0xFF999999),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: ()=> {
          Navigator.pushNamed(context, "/oneDetail", arguments: {
            "oneItem": oneItem
          })
        },
        child: Container(
          margin: EdgeInsets.fromLTRB(16, 16, 16, 0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                blurRadius: 6,
                spreadRadius: 4,
                color: Color.fromARGB(20, 0, 0, 0),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              this.renderCover(),
              this.renderInfo(),
              this.renderInteractionArea(),
            ],
          ),
        ));
  }
}
