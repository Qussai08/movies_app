import 'package:flutter/material.dart';
import 'package:movies_app/src/app.dart';
import 'package:movies_app/src/core/base_api.dart';

void main() async {
  await BaseApi.initializeDio();
  runApp(const App());
}
