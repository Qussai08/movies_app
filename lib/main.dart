import 'package:flutter/material.dart';
import 'package:movies_app/src/app.dart';
import 'package:movies_app/src/core/base_api.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await BaseApi.initializeDio();
  runApp(const App());
}
