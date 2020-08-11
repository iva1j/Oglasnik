import 'package:Oglasnik/view/RegisterHome/widgets/mainFloatingButton/mojiOglasiButton.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/mainFloatingButton/sacuvanoButton.dart';
import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:flutter/material.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/mainFloatingButton/noviOglasButton.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/mainFloatingButton/profilButton.dart';

Stack mainFloatingButton(String email) {
  return Stack(overflow: Overflow.visible, children: <Widget>[
    Builder(
      builder: (context) => FabCircularMenu(
        alignment: Alignment.bottomRight,
        ringColor: Colors.grey[50].withAlpha(210),
        ringDiameter: 350.0,
        ringWidth: 76.0,
        fabColor: Colors.white,
        fabOpenIcon: Icon(
          Icons.add,
          color: Color.fromARGB(255, 226, 11, 48),
        ),
        fabCloseIcon: Icon(
          Icons.close,
          color: Color.fromARGB(255, 226, 11, 48),
        ),
        fabMargin: const EdgeInsets.only(bottom: 24.0, right: 20.0),
        children: <Widget>[
          SacuvanoButton(),
          MojiOglasiButton(
            email: email,
          ),
          NoviOglasButton(),
          ProfilButton(),
          SizedBox.fromSize(
            size: Size(80, 80), // button width and height
            child: ClipOval(
              child: Material(
                color: Colors.transparent, // button color
                child: InkWell(),
              ),
            ),
          )
        ],
      ),
    ),
  ]);
}
