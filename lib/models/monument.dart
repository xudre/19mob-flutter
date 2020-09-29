import 'package:flutter/foundation.dart';
import 'package:flutter_19mob/models/monument_location.dart';

class Monument {
  final String id;
  final String name;
  final String description;
  final MonumentLocation location;
  final String image;

  Monument(
      {@required this.id,
      @required this.name,
      @required this.description,
      @required this.location,
      @required this.image})
      : assert(id != null),
        assert(name != null),
        assert(description != null),
        assert(location != null);

  static Monument fromJson(Map<String, dynamic> data) => Monument(
      id: data["id"],
      name: data["name"],
      description: data["description"],
      location: MonumentLocation.fromJson(data["location"]),
      image: data["image"]);
}
