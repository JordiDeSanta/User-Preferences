import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key key}) : super(key: key);

  static final String routeName = 'settings';

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Settings'),
        ),
        body: Center(
          child: Text('Settings Page'),
        ),
      ),
    );
  }
}
