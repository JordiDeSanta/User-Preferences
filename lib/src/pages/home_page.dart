import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:userprefs/src/user_prefs/user_preferences.dart';
import 'package:userprefs/src/widgets/drawer_menu.dart';

class HomePage extends StatelessWidget {
  static final String routeName = 'home';
  final prefs = new UserPreferences();

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
            Text('Genre: ${prefs.genre}'),
            Divider(),
            Text('Username:'),
            Divider(),
          ],
        ),
        drawer: DrawerMenu(),
      ),
    );
  }

  Future<String> getGenre() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    int genreValue = prefs.getInt('genre');

    switch (genreValue) {
      case 1:
        return 'Male';
        break;
      case 2:
        return 'Female';
        break;
      default:
        return 'Male';
    }
  }
}
