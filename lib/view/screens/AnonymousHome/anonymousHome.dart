import 'package:Oglasnik/view/screens/Auth/register.dart';
import 'package:Oglasnik/view/screens/Auth/signin.dart';
import 'package:Oglasnik/viewModel/AuthViewModel.dart';
import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AnonymouseHome extends StatefulWidget {
  @override
  _AnonymouseHomeState createState() => _AnonymouseHomeState();
}

class _AnonymouseHomeState extends State<AnonymouseHome> {
  //R final FirebaseAuth auth = FirebaseAuth.instance;
  final AnonymousViewModel auth = AnonymousViewModel();

  @override
  void initState() {
    super.initState();
    //   _handleAnonymousSignIn(); //#TODO odkomentarisati prije DEMO/review
  }

  Future<FirebaseUser> _handleAnonymousSignIn() async {
    dynamic result = await auth.getAnonymous();
    return result;
  }

  final GlobalKey<FabCircularMenuState> fabKey = GlobalKey();

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppBarTheme.of(context).color,
        centerTitle: true,
        title: Text('Oglasnik'),
      ),
      body: Container(color: Colors.white),
      floatingActionButton:
          Stack(overflow: Overflow.visible, children: <Widget>[
        Builder(
          builder: (context) => FabCircularMenu(
            key: fabKey,
            alignment: Alignment.bottomRight,
            ringColor: Colors.black.withAlpha(10),
            ringDiameter: 350.0,
            ringWidth: 76.0,
            fabColor: Colors.white,
            fabOpenIcon: Icon(
              Icons.person,
              color: Color.fromARGB(255, 226, 11, 48),
            ),
            fabCloseIcon: Icon(
              Icons.close,
              color: Color.fromARGB(255, 226, 11, 48),
            ),
            fabMargin: const EdgeInsets.only(bottom: 24.0, right: 20.0),
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(bottom: 84.0, left: 10.0),
                child: SizedBox.fromSize(
                  size: Size(80, 80), // button width and height
                  child: ClipOval(
                    child: Material(
                      color: Colors.transparent, // button color
                      child: InkWell(
                        splashColor: Colors.transparent, // splash color
                        onTap: () => Navigator.of(context)
                            .pushReplacement(MaterialPageRoute(builder: (_) {
                          return SigninPage();
                        })), // button pressed
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(Icons.person), // icon
                            Text("Prijava"), // text
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox.fromSize(
                size: Size(80, 80), // button width and height
                child: ClipOval(
                  child: Material(
                    color: Colors.transparent, // button color
                    child: InkWell(
                      splashColor: Colors.transparent, // splash color
                      onTap: () => Navigator.of(context)
                          .pushReplacement(MaterialPageRoute(builder: (_) {
                        return RegisterPage();
                      })), // button pressed
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.person_add), // icon
                          Text("Registracija"), // text
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ]),
      bottomSheet: Container(
        height: 55,
        width: double.infinity,
        color: Color.fromARGB(255, 226, 11, 48),
      ),
    );
  }
}
