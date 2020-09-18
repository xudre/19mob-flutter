import 'package:flutter/material.dart';
import 'package:flutter_19mob/models/monument.dart';
import 'package:flutter_19mob/routes/detail/detail_page_arguments.dart';

class DetailPage extends StatefulWidget {
  static const routeName = "/detail";

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  Monument _monument;

  @override
  Widget build(BuildContext context) {
    final DetailPageArguments args = ModalRoute.of(context).settings.arguments;

    _monument = args.monument;

    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Row(
          children: [
            Text(_monument.name),
            Text(_monument.description),
          ],
        ),
      ),
    );
  }
}
