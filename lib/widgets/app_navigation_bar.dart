import 'package:flutter/material.dart';
import 'package:flutter_19mob/routes/about/about_page.dart';
import 'package:flutter_19mob/routes/home/home_page.dart';

class AppNavigationBar extends StatefulWidget {
  final GlobalKey<NavigatorState> _navigatorKey;

  AppNavigationBar(this._navigatorKey) : assert(_navigatorKey != null);

  @override
  _AppNavigationBarState createState() => _AppNavigationBarState();
}

class _AppNavigationBarState extends State<AppNavigationBar> {
  int _onIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _onIndex,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          title: Text("Monumentos"),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.info),
          title: Text("Sobre"),
        ),
      ],
      onTap: (index) {
        if (index == _onIndex) return;

        switch (index) {
          case 0:
            widget._navigatorKey.currentState.pushNamed(HomePage.routeName);

            break;
          case 1:
            widget._navigatorKey.currentState.pushNamed(AboutPage.routeName);
            break;
        }

        setState(() {
          _onIndex = index;
        });
      },
    );
  }
}
