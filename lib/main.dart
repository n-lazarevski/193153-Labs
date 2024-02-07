
import 'package:finki/screens/auth_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:finki/screens/calendar.dart';
import 'package:finki/screens/exam_details.dart';
import 'package:finki/screens/main_screen.dart';
import 'package:finki/screens/map_screen.dart';

import 'firebase_options.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
  runApp(MaterialApp(
    // home: MainScreen(),
    initialRoute: '/',
    routes: {
      '/': (ctx) => AuthScreen(),
      '/home':(ctx) => MyHomePage(),
      ExamDetailScreen.routeName: (ctx) => ExamDetailScreen(),
      CalendarScreen.routeName: (ctx) => CalendarScreen(),
      MapScreen.routeName: (ctx) => MapScreen()
    },
    theme: ThemeData(
      primarySwatch: Colors.pink,
    ),
  ));
}


