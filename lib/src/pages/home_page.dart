import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:userprefs/src/pages/settings_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  static final String routeName = 'home';

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarDividerColor: Colors.white,
    ));

    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('User Prefenences'),
        ),
        body: Column(
          children: [
            Text('Secondary Color:'),
            Divider(),
            Text('Genre:'),
            Divider(),
            Text('Username:'),
            Divider(),
          ],
        ),
        drawer: _createMenu(context),
      ),
    );
  }

  Drawer _createMenu(BuildContext c) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            child: Container(),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/img/menu-img.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.pages, color: Colors.blue),
            title: Text('Pages'),
            onTap: () {
              Navigator.pushNamed(c, SettingsPage.routeName);
            },
          ),
          ListTile(
            leading: Icon(Icons.settings, color: Colors.blue),
            title: Text('Settings'),
            onTap: () {
              Navigator.pushNamed(c, SettingsPage.routeName);
            },
          )
        ],
      ),
    );
  }
}
