import 'package:flutter/material.dart';
import 'package:md3/view/screens/home/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Demo App',
      theme: ThemeData(fontFamily: 'Montserrat'),
      home: Home(),
    );
  }
}
