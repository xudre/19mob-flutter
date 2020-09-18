import 'package:flutter/material.dart';
import 'package:flutter_19mob/routes/about/about_page.dart';
import 'package:flutter_19mob/routes/detail/detail_page.dart';
import 'package:flutter_19mob/routes/home/home_page.dart';

class AppNavigator extends StatelessWidget {
  final GlobalKey<NavigatorState> _key;

  AppNavigator(this._key) : assert(_key != null);

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: _key,
      initialRoute: HomePage.routeName,
      onGenerateRoute: (settings) {
        var builder;

        switch (settings.name) {
          case HomePage.routeName:
            builder = (context) => HomePage();
            break;
          case DetailPage.routeName:
            builder = (context) => DetailPage();
            break;
          case AboutPage.routeName:
            builder = (context) => AboutPage();
            break;
          default:
            throw Exception("Invalid route for: ${settings.name}");
        }

        return MaterialPageRoute(builder: builder, settings: settings);
      },
    );
  }
}
