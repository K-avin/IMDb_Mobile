import 'package:flutter/material.dart';
import 'Views/Auth/Welcome/welcomePage.dart';
import 'config.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Moveez',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        scaffoldBackgroundColor: kBackgroundColor,
      ),
      home: WelcomePage(),
    );
  }
}
