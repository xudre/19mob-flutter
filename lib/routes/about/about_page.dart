import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  static const routeName = "/about";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blue,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FlutterLogo(size: 50.0),
              SizedBox(height: 10),
              Text(
                'Trabalho de Flutter',
                style: TextStyle(
                    fontSize: 40, color: Colors.white, fontFamily: "Pacifico"),
              ),
              Text(
                'Integrantes',
                style: TextStyle(
                    letterSpacing: 2.5,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal.shade100,
                    fontFamily: "Source Sans Pro"),
              ),
              SizedBox(
                height: 20,
                width: 150,
                child: Divider(
                  color: Colors.white,
                ),
              ),
              Card(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: Icon(
                      Icons.account_circle,
                      color: Colors.teal,
                    ),
                    title: Text(
                      "Vitor Ferraz Varela -  RM336042",
                      style: TextStyle(
                        color: Colors.teal.shade900,
                        fontFamily: "Source Sans Pro",
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
              Card(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: Icon(
                      Icons.account_circle,
                      color: Colors.teal,
                    ),
                    title: Text(
                      "Décio Lucas Borges Montanhani - RM336080",
                      style: TextStyle(
                        color: Colors.teal.shade900,
                        fontFamily: "Source Sans Pro",
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
              Card(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: Icon(
                      Icons.account_circle,
                      color: Colors.teal,
                    ),
                    title: Text(
                      "Pedro Xudre - RM336544",
                      style: TextStyle(
                        color: Colors.teal.shade900,
                        fontFamily: "Source Sans Pro",
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
              Card(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: Icon(
                      Icons.account_circle,
                      color: Colors.teal,
                    ),
                    title: Text(
                      "Bruno Martins Cortez - RM335963",
                      style: TextStyle(
                        color: Colors.teal.shade900,
                        fontFamily: "Source Sans Pro",
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
