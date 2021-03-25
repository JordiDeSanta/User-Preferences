import 'package:flutter/material.dart';

import 'package:userprefs/src/pages/home_page.dart';
import 'package:userprefs/src/pages/settings_page.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          _createTile(context, HomePage.routeName, Icons.home, 'Home'),
          _createTile(
              context, HomePage.routeName, Icons.party_mode, 'Party Mode'),
          _createTile(context, HomePage.routeName, Icons.people, 'People'),
          _createTile(
              context, SettingsPage.routeName, Icons.settings, 'Settings'),
        ],
      ),
    );
  }

  Widget _createTile(BuildContext c, String route, IconData icon, String name) {
    return ListTile(
      leading: Icon(icon, color: Colors.blue),
      title: Text(name),
      onTap: () {
        Navigator.pushReplacementNamed(c, route);
      },
    );
  }
}
