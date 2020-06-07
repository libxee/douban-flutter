import 'package:flutter/material.dart';

class OneDetail extends StatefulWidget {
  final arguments;
  OneDetail({Key key, this.arguments}) : super(key: key);
  @override
  _OneDetailState createState() => _OneDetailState();
}

class _OneDetailState extends State<OneDetail> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("one detail page"),
    );
  }
}
