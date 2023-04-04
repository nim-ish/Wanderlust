import 'package:flutter/material.dart';
import 'package:wanderlust/screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wanderlust App',
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.blueGrey,
         // Set the app brightness to light by default
      ),
      home: HomeScreen(),
    );
  }
}