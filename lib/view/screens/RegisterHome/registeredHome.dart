import 'package:Oglasnik/model/userModel.dart';
import 'package:Oglasnik/viewModel/anonymousViewModel.dart';
import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:flutter/material.dart';

class RegisteredHome extends StatefulWidget {
  @override
  _RegisteredHomeState createState() => _RegisteredHomeState();
}

class _RegisteredHomeState extends State<RegisteredHome> {
  List<dynamic> users =[];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppBarTheme.of(context).color,
        centerTitle: true,
        title: Text('Oglasnik'),
      ),
      body: ListView(
        shrinkWrap: true,
        children: <Widget>[
          FutureBuilder(
              future: AnonymousViewModel().getAnonymous(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  users = snapshot.data
                      .map((doc) => User.fromDocument(doc))
                      .toList();
                  return ListView.builder(
                      shrinkWrap: true,
                      itemCount: users.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          child: Text(users[index].fullName),
                        );
                      });
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              }),
        ],
      ),
      floatingActionButton: Stack(
        children: <Widget>[
          FabCircularMenu(
            children: <Widget>[
              Container(),
              Stack(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Icon(Icons.add_circle_outline),
                      Text('Novi oglas'),
                    ],
                  ),
                  SizedBox(
                    height: 90,
                    width: 180,
                  ),
                ],
              ),
              Stack(
                fit: StackFit.passthrough,
                children: <Widget>[
                  Column(
                    children: <Widget>[],
                  ),
                ],
              ),
            ],
            fabCloseIcon: Icon(
              Icons.clear,
              color: Color.fromARGB(255, 226, 11, 48),
            ),
            fabOpenIcon: Icon(
              Icons.add,
              color: Color.fromARGB(255, 226, 11, 48),
            ),
            ringWidth: 120,
            ringDiameter: 250,
            fabElevation: 100,
            alignment: Alignment.bottomRight,
            fabColor: Colors.white,
            ringColor: Colors.transparent,
          ),
        ],
      ),
      bottomSheet: Container(
        height: 60,
        width: double.infinity,
        color: Color.fromARGB(255, 226, 11, 48),
      ),
    );
  }
}
