import 'package:flutter/material.dart';
import 'package:flutter_19mob/routes/about/about_page.dart';
import 'package:flutter_19mob/routes/home/home_page.dart';

class AppNavigationBar extends StatefulWidget {
  final GlobalKey<NavigatorState> _navigatorKey;

  const AppNavigationBar(GlobalKey<AppNavigationBarState> key, this._navigatorKey)
      : assert(key != null),
        assert(_navigatorKey != null),
        super(key: key);

  @override
  AppNavigationBarState createState() => AppNavigationBarState();
}

class AppNavigationBarState extends State<AppNavigationBar> {
  int _onIndex = 0;

  void setIndex(int value) {
    setState(() {
      _onIndex = value;
    });
  }

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
