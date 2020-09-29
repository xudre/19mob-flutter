import 'package:flutter/foundation.dart';

class MonumentLocation {
  final double lat;
  final double lng;
  final String zipCode;

  MonumentLocation(
      {@required this.lat, @required this.lng, @required this.zipCode})
      : assert(lat != null),
        assert(lng != null),
        assert(zipCode != null);

  static MonumentLocation fromJson(Map<String, dynamic> data) =>
      MonumentLocation(
          lat: data["lat"].toDouble(),
          lng: data["lng"].toDouble(),
          zipCode: data["zipCode"]);
}
