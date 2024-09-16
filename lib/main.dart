import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:up_todo/app.dart';
import 'package:up_todo/firebase_options.dart';

void main() async {
  // -- Widget Binding
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(systemNavigationBarColor: Colors.transparent));

  // -- Init Local Storage
  await SharedPreferences.getInstance();

  // -- Await Native Splash
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  // -- Initialize Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // TODO: Initialize Authenication

  runApp(const ProviderScope(child: App()));
}

//TODO: Resolve issue with app working on Android 
