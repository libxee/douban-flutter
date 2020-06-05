import 'package:flutter/material.dart';
import 'package:flutterdemo/components/bottom_navigation_widget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ALL',

      theme: ThemeData(
        primaryColor: Colors.white,
        primarySwatch: Colors.blue,

      ),
      home: BottomNavigationWidget(),
    );
  }
}
