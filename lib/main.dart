import 'package:flutter/material.dart';
import 'package:Oglasnik/view/screens/register.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Oglasnik',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: RegisterPage(),
    );
  }
}
