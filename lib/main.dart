import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:up_todo/app.dart';
import 'package:up_todo/firebase_options.dart';
import 'package:up_todo/src/features/todo/models/category/hive_adapter/category_adapter.dart';
import 'package:up_todo/src/features/todo/models/category/category_model.dart';
import 'package:up_todo/src/features/todo/models/todo/hive_adapter/task_model_adapter.dart';
import 'package:up_todo/src/features/todo/models/todo/task_model.dart';

void main() async {
  // -- Widget Binding
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(systemNavigationBarColor: Colors.transparent));

  // Register Hive Adapter
  Hive.registerAdapter(TaskModelAdapter());
  Hive.registerAdapter(CategoryAdapter());

  // -- Init Local Storage
  await SharedPreferences.getInstance();
  await Hive.initFlutter(); //Initialization of Hive

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
