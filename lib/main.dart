import 'package:flutter/material.dart';
import 'package:wanderlust/screens/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:wanderlust/utils/colors_util.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wanderlust App',
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.deepOrangeAccent,
        textTheme: GoogleFonts.latoTextTheme(Theme.of(context).textTheme),
      ),
      home: HomeScreen(),
    );
  }
}
