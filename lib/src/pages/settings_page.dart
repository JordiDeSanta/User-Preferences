import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:userprefs/src/user_prefs/user_preferences.dart';

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

  bool _secondaryColor;
  int _genre;
  String _name;

  TextEditingController _textController;

  UserPreferences prefs = new UserPreferences();

  @override
  void initState() {
    super.initState();

    prefs.lastPage = SettingsPage.routeName;

    _genre = prefs.genre;
    _secondaryColor = prefs.secondaryColor;
    _textController = new TextEditingController(
      text: prefs.name,
    );
  }

  loadPref() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    _genre = prefs.getInt('genre');
    setState(() {});
  }

  _setSelectedRadio(int value) {
    prefs.genre = value;
    _genre = value;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Settings'),
          backgroundColor: (prefs.secondaryColor) ? Colors.red : Colors.blue,
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
                _secondaryColor = b;
                prefs.secondaryColor = b;
                setState(() {});
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
                onChanged: (t) {
                  prefs.name = t;
                  _name = t;
                  setState(() {});
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
