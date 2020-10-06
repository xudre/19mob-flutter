import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_19mob/main.dart';
import 'package:flutter_19mob/models/monument.dart';
import 'package:flutter_19mob/routes/detail/detail_page_arguments.dart';
import 'package:get_it/get_it.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class DetailPage extends StatefulWidget {
  static const routeName = "/detail";

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  Monument _monument;

  CameraPosition _monumentPosition;
  String _monumentAddress = "Carregando...";

  GoogleMapController _controller;

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
      await platform.invokeMethod("share", {"value": _monument.description});
      setState(() {});
    } on PlatformException catch (e) {}
  }

  void _loadAddressFromZipCode() async {
    Dio dio = await getIt.getAsync<Dio>();

    String zipCode = _monument.location.zipCode.replaceAll("-", "").trim();

    Response response =
        await dio.get("https://viacep.com.br/ws/$zipCode/json/");

    Map<String, dynamic> data = response.data;

    setState(() {
      _monumentAddress = data["logradouro"] + ", " + data["bairro"];

      MarkerId markerId = MarkerId(_monument.id);

      _controller.hideMarkerInfoWindow(markerId);

      Future.delayed(Duration(milliseconds: 300))
          .then((value) => _controller.showMarkerInfoWindow(markerId));
    });
  }

  @override
  void initState() {
    super.initState();

    _loadAddressFromZipCode();
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
        child: ListView(
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
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: OutlineButton(
                onPressed: _shareINDevice,
                child: Icon(Icons.share),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: Text("Localização"),
            ),
            Container(
              height: 400.0,
              child: GoogleMap(
                mapType: MapType.normal,
                markers: Set()
                  ..add(Marker(
                    markerId: MarkerId(_monument.id),
                    position: _monumentPosition.target,
                    infoWindow: InfoWindow(
                        title: "Endereço", snippet: _monumentAddress),
                  )),
                initialCameraPosition: _monumentPosition,
                zoomControlsEnabled: false,
                compassEnabled: true,
                onMapCreated: (GoogleMapController controller) {
                  setState(() {
                    _controller = controller;

                    _controller.showMarkerInfoWindow(MarkerId(_monument.id));
                  });
                },
                gestureRecognizers: Set()
                  ..add(Factory<EagerGestureRecognizer>(
                      () => EagerGestureRecognizer())),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
