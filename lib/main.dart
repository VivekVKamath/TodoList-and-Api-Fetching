import 'package:ffgame3/ui/learning_tasks/doctor_details.dart';
import 'package:ffgame3/ui/learning_tasks/jivini_home.dart';
import 'package:ffgame3/ui/ffgame3/splash.dart';
import 'package:ffgame3/ui/ffgame3/phonenumber.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SplashPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
