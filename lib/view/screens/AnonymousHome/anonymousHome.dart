import 'package:Oglasnik/view/screens/RegisterHome/registeredUser.dart';
import 'package:Oglasnik/view/widgets/specialElements.dart';
import 'package:animated_floatactionbuttons/animated_floatactionbuttons.dart';
import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:flutter/material.dart';

class AnonymouseHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppBarTheme.of(context).color,
        centerTitle: true,
        title: Text('Oglasnik'),
      ),
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
                            print('onpressed-button');
                            return RegisteredUser();
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
        height: 60,
        width: double.infinity,
        color: Color.fromARGB(255, 226, 11, 48),
      ),
    );
  }
}
