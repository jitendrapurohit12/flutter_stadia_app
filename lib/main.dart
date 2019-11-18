import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stadia_app/pages/landing_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(canvasColor: Colors.white, primarySwatch: Colors.blue, fontFamily: 'Oxygen'),
      home: LandingPage(),
    );
  }
}
