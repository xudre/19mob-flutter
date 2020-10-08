import 'package:flutter/material.dart';
import 'package:flutter_19mob/widgets/app_navigation_bar.dart';
import 'package:flutter_19mob/widgets/app_navigator.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:mobx/mobx.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> with NavigatorObserver {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

  @computed
  NavigatorState get navState => _navigatorKey.currentState;

  @override
  void didPop(Route<dynamic> route, Route<dynamic> previousRoute) {
    setState(() {});
  }

  @override
  void didPush(Route<dynamic> route, Route<dynamic> previousRoute) {
    setState(() {});
  }

  Widget _buildAppBackButton() {
    if (navState == null) {
      return null;
    }

    return navState.canPop()
        ? BackButton(
            onPressed: () {
              if (navState.canPop()) {
                navState.pop(false);
              }
            },
          )
        : null;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return Container();
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(
            home: WillPopScope(
              onWillPop: () async {
                if (_navigatorKey.currentState.canPop()) {
                  _navigatorKey.currentState.pop(false);
                }

                return false;
              },
              child: Scaffold(
                appBar: AppBar(
                  title: Text("Monumentos SP"),
                  leading: _buildAppBackButton(),
                ),
                body: AppNavigator(_navigatorKey, [this]),
                bottomNavigationBar: AppNavigationBar(_navigatorKey),
              ),
            ),
          );
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return Container();
      },
    );
  }
}
