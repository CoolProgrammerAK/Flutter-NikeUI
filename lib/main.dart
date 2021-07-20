import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mynike/pages/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme:GoogleFonts.latoTextTheme(
          Theme.of(context).textTheme
        ),
        primarySwatch: Colors.blue,
      ),
      home: HomeWidget(),
    );
  }
}

