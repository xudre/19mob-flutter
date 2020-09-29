import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../models/monument.dart';
import 'package:mobx/mobx.dart';

import '../detail/detail_page.dart';
import '../detail/detail_page_arguments.dart';
import '../../models/monument.dart';

class HomePage extends StatefulWidget {
  static const routeName = "/";

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget _buildBody(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('monumentos').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return LinearProgressIndicator();

        return _buildList(context, snapshot.data.documents);
      },
    );
  }

  Widget _buildList(BuildContext context, List<DocumentSnapshot> snapshot) {
    return ListView(
      padding: const EdgeInsets.only(top: 10.0),
      children: snapshot.map((data) => _buildListItem(context, data)).toList(),
    );
  }

  Widget _buildListItem(
      BuildContext context, DocumentSnapshot documentSnapshot) {
    final record = Monument.fromJson(
        {"id": documentSnapshot.id, ...documentSnapshot.data()});

    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(DetailPage.routeName,
            arguments: DetailPageArguments(record));
      },
      child: Card(
        margin: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            leading: Image.network(record.image),
            title: Text(
              record.name,
              style: TextStyle(
                color: Theme.of(context).accentColor,
                fontFamily: "Source Sans Pro",
                fontSize: 18,
              ),
            ),
            trailing: Icon(
              Icons.arrow_forward_ios,
              size: 14,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: _buildBody(context),
      ),
    );
  }
}
