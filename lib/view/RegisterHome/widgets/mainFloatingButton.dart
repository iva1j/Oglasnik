import 'package:Oglasnik/utils/specialElements.dart';
import 'package:Oglasnik/view/PostScreens/Pages/articalName.dart';
import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:flutter/material.dart';

final GlobalKey<FabCircularMenuState> fabKey = GlobalKey();
Stack mainFloatingButton() {
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
          Icons.add,
          color: Color.fromARGB(255, 226, 11, 48),
        ),
        fabCloseIcon: Icon(
          Icons.close,
          color: Color.fromARGB(255, 226, 11, 48),
        ),
        fabMargin: const EdgeInsets.only(bottom: 24.0, right: 20.0),
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(bottom: 184.0, left: 60.0),
            child: SizedBox.fromSize(
              size: Size(80, 80), // button width and height
              child: ClipOval(
                child: Material(
                  color: Colors.transparent, // button color
                  child: InkWell(
                    splashColor: Colors.transparent, // splash color

                    onTap: () {
                      Navigator.of(context)
                          .pushReplacement(FadeRoute(page: ArticalName()));
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(Icons.add_circle_outline), // icon
                        Text("Novi oglas"), // text
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
                child: InkWell(),
              ),
            ),
          )
        ],
      ),
    ),
  ]);
}
