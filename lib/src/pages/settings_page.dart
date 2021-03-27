import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:userprefs/src/widgets/drawer_menu.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key key}) : super(key: key);

  static final String routeName = 'settings';

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final TextStyle titleStyle = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 40,
  );

  bool _secondaryColor = false;
  int _genre = 1;
  String _name = 'Jordi';

  TextEditingController _textController;

  @override
  void initState() {
    super.initState();
    loadPref();

    _textController = new TextEditingController(
      text: _name,
    );
  }

  loadPref() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    _genre = prefs.getInt('genre');
    setState(() {});
  }

  _setSelectedRadio(int value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setInt('genre', value);

    _genre = value;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Settings'),
        ),
        drawer: DrawerMenu(),
        body: ListView(
          children: [
            Container(
              padding: EdgeInsets.all(5.0),
              child: Text('Settings', style: titleStyle),
            ),
            Divider(),
            SwitchListTile(
              title: Text('Secondary Color'),
              value: _secondaryColor,
              onChanged: (b) {
                setState(() {
                  _secondaryColor = b;
                });
              },
            ),
            RadioListTile(
              title: Text('Male'),
              value: 1,
              groupValue: _genre,
              onChanged: _setSelectedRadio,
            ),
            RadioListTile(
              title: Text('Female'),
              value: 2,
              groupValue: _genre,
              onChanged: _setSelectedRadio,
            ),
            Divider(),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                controller: _textController,
                decoration: InputDecoration(
                  labelText: 'Name',
                  helperText: 'Name of the person using the phone',
                ),
                onChanged: (t) {},
              ),
            )
          ],
        ),
      ),
    );
  }
}
