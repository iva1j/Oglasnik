import 'package:Oglasnik/utils/specialElements.dart';
import 'package:Oglasnik/view/RegistrationPage/register.dart';
import 'package:Oglasnik/view/SignInPage/signin.dart';
import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:flutter/material.dart';

final GlobalKey<FabCircularMenuState> fabKey = GlobalKey();

Stack homeFloatingAnimatedButton() {
  return Stack(overflow: Overflow.visible, children: <Widget>[
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
                    onTap: () {
                      Navigator.of(context)
                          .pushReplacement(FadeRoute(page: SigninPage()));
                    },

                    // button pressed
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
                  onTap: () {
                    Navigator.of(context)
                        .pushReplacement(FadeRoute(page: RegisterPage()));
                  }, // button pressed
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
  ]);
}
