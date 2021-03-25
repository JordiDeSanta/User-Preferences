import 'package:flutter/material.dart';
import 'package:userprefs/src/pages/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'User Preferences',
      home: HomePage(),
    );
  }
}
