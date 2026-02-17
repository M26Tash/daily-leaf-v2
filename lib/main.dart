import 'dart:io';

import 'package:flutter/material.dart';
import 'package:daily_leaf/src/features/app/pages/app.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  // ! Temporary
  HttpOverrides.global = MyHttpOverrides();

  // await LocalNotificationService.init();

  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  await dotenv.load(fileName: ".env");
  
  runApp(
    const App(),
  );
}
