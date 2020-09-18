import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  static const routeName = "/about";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Center(
          child: Text("Informações sobre o app e desenvolvedores..."),
        ),
      ),
    );
  }
}
