import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_19mob/widgets/app.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  getIt.registerSingletonAsync<Dio>(() async {
    return Dio();
  });
  runApp(App());
}
