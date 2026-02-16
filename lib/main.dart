import 'dart:io';

import 'package:flutter/material.dart';
import 'package:news_app/src/features/app/pages/app.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() {
  // Временно в main.dart
  HttpOverrides.global = MyHttpOverrides();

  runApp(
    const App(),
  );
}
