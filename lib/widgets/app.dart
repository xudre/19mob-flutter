import 'package:flutter/material.dart';
import 'package:flutter_19mob/widgets/app_navigation_bar.dart';
import 'package:flutter_19mob/widgets/app_navigator.dart';

import 'package:firebase_core/firebase_core.dart';

class App extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

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
          var _navigatorKey = GlobalKey<NavigatorState>();

          return MaterialApp(
            home: Scaffold(
              body: AppNavigator(_navigatorKey),
              bottomNavigationBar: AppNavigationBar(_navigatorKey),
            ),
          );
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return Container();
      },
    );
  }
}
