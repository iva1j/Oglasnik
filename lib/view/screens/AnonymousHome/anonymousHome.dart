import 'package:Oglasnik/view/screens/Auth/register.dart';
import 'package:Oglasnik/viewModel/anonymousViewModel.dart';
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
    _handleAnonymousSignIn(); //#TODO odkomentarisati prije DEMO/review
  }
  Future<FirebaseUser> _handleAnonymousSignIn()async{
    dynamic result = await auth.getAnonymous();
    return result;
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppBarTheme.of(context).color,
        centerTitle: true,
        title: Text('Oglasnik'),
      ),
      body: Center(child: Text('Anonymous user stored in Firebase')),
      floatingActionButton: Stack(
        overflow: Overflow.visible,
        children: <Widget>[
          FabCircularMenu(
            children: <Widget>[
              Container(),
              Stack(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      SizedBox(
                        child: RawMaterialButton(
                          child: Icon(Icons.person),
                          onPressed: () {
                            print('object');
                          },
                        ),
                      ),
                      Text('Prijava'),
                    ],
                  ),
                  SizedBox(
                    height: 90,
                    width: 180,
                  ),
                ],
              ),
              Stack(
                overflow: Overflow.visible,
                //  fit: StackFit.passthrough,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      SizedBox(
                        child: IconButton(
                          onPressed: () => Navigator.of(context)
                              .pushReplacement(MaterialPageRoute(builder: (_) {
                            return RegisterPage();
                          })),
                          icon: Icon(Icons.person_add),
                        ),
                      ),
                      Text('Registracija'),
                    ],
                  ),
                ],
              ),
            ],
            fabCloseIcon: Icon(
              Icons.person,
              color: Color.fromARGB(255, 226, 11, 48),
            ),
            fabOpenIcon: Icon(
              Icons.person,
              color: Color.fromARGB(255, 226, 11, 48),
            ),
            ringWidth: 120,
            ringDiameter: 200,
            fabElevation: 100,
            alignment: Alignment.bottomRight,
            fabColor: Colors.white,
            ringColor: Colors.transparent,
          ),
        ],
      ),
      bottomSheet: Container(
        height: 56,
        width: double.infinity,
        color: Color.fromARGB(255, 226, 11, 48),
      ),
    );
  }
}
