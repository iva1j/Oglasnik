import 'package:Oglasnik/utils/shared/globalVariables.dart';
import 'package:Oglasnik/utils/strings.dart';
import 'package:Oglasnik/utils/transitionFade.dart';
import 'package:Oglasnik/view/PostScreens/pages/articlePage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:flutter/material.dart';

//final GlobalKey<FabCircularMenuState> registeredButtonKey = GlobalKey();
Stack mainFloatingButton(String email) {
  return Stack(overflow: Overflow.visible, children: <Widget>[
    Builder(
      builder: (context) => FabCircularMenu(
        //key: registeredButtonKey,

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
                      createSwitcher = true;
                      Navigator.of(context).pushReplacement(FadeRoute(
                          page: ArticlePage(
                        editProduct: UserProducts().newProduct,
                        
                        productSnapshot: null,
                      )));
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(Icons.add_circle_outline), // icon
                        Text("Novi oglas"),
                        // text
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
