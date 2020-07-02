import 'package:Oglasnik/view/RegisterHome/widgets/mainFloatingButton.dart';
import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:flutter/material.dart';

class RegisteredHome extends StatefulWidget {
  @override
  _RegisteredHomeState createState() => _RegisteredHomeState();
}

final GlobalKey<FabCircularMenuState> fabKey = GlobalKey();

class _RegisteredHomeState extends State<RegisteredHome> {
  List<dynamic> users = [];
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppBarTheme.of(context).color,
        centerTitle: true,
        title: Text('Oglasnik'),
      ),
      floatingActionButton: mainFloatingButton(),
      bottomSheet: Container(
        height: 55,
        width: double.infinity,
        color: Color.fromARGB(255, 226, 11, 48),
      ),
    );
  }
}
