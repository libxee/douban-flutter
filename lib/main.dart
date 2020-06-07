import 'package:flutter/material.dart';
import 'package:flutterdemo/components/bottom_navigation_widget.dart';
import 'package:flutterdemo/router/notfound.dart';
import 'package:flutterdemo/router/routes.dart';
import 'package:flutterdemo/router/routes.dart';

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
      initialRoute: "/",
      onGenerateRoute: onGenerateRoute,
      onUnknownRoute: (RouteSettings setting) =>
          MaterialPageRoute(builder: (context) => UnknownPage()),
    );
  }
}
