import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_19mob/models/monument.dart';
import 'package:flutter_19mob/routes/detail/detail_page_arguments.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/services.dart';

class DetailPage extends StatefulWidget {
  static const routeName = "/detail";

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  Monument _monument;

  CameraPosition _monumentPosition;

  Completer<GoogleMapController> _controller = Completer();

  showAlertDialog(BuildContext context) {
    // set up the button
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {},
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Platform Channel"),
      content: Text("response."),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  // int _numberSensors = 0;
  static const platform = const MethodChannel('app/share');

  void _shareINDevice() async {
    try {
      // final int numberSensors = await platform.invokeMethod("share");
      await platform.invokeMethod("share");
      setState(() {});
    } on PlatformException catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    final DetailPageArguments args = ModalRoute.of(context).settings.arguments;

    _monument = args.monument;
    _monumentPosition = CameraPosition(
      target: LatLng(_monument.location.lat, _monument.location.lng),
      zoom: 14.4746,
    );

    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(_monument.image),
            Container(
              height: 20.0,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                _monument.name,
                style: TextStyle(
                  fontSize: 24.0,
                ),
              ),
            ),
            Container(
              height: 10.0,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                _monument.description,
                style: TextStyle(
                  fontSize: 16.0,
                ),
                textAlign: TextAlign.justify,
              ),
            ),
            Container(
              height: 10.0,
            ),
            ElevatedButton(
              onPressed: _shareINDevice,
              child: Icon(Icons.share),
            ),
            // GoogleMap(
            //   mapType: MapType.hybrid,
            //   initialCameraPosition: _monumentPosition,
            //   onMapCreated: (GoogleMapController controller) {
            //     _controller.complete(controller);
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}
