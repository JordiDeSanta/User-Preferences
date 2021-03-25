import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('User Prefenences'),
        ),
        body: Center(
          child: Container(
            child: Text('Basic Structure'),
          ),
        ),
      ),
    );
  }
}
