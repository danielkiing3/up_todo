import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:up_todo/app.dart';

void main() {
  // TODO: Add Widget Binding
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(systemNavigationBarColor: Colors.transparent));
  // TODO: Init Local Storage
  // TODO: Await Native Splash
  // TODO: Initialize Firebase
  // TODO: Initialize Authenication

  runApp(const App());
}
