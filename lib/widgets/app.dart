import 'package:flutter/material.dart';
import 'package:flutter_19mob/widgets/app_navigation_bar.dart';
import 'package:flutter_19mob/widgets/app_navigator.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _navigatorKey = GlobalKey<NavigatorState>();

    return MaterialApp(
      home: Scaffold(
        body: AppNavigator(_navigatorKey),
        bottomNavigationBar: AppNavigationBar(_navigatorKey),
      ),
    );
  }
}
