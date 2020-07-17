import 'dart:ui';

import 'package:Oglasnik/utils/strings.dart';
import 'package:Oglasnik/utils/text_form_fields.dart';
import 'package:Oglasnik/utils/shared/globalVariables.dart';
import 'package:Oglasnik/view/AnonymousHome/pages/anonymousHome.dart';
import 'package:flutter/material.dart';
import 'package:Oglasnik/view/RegisterHome/pages/registeredHome.dart';

//pink button used in most places in the application
SizedBox button(dynamic nameFunction, dynamic function) {
  return SizedBox(
    height: 50,
    width: 250,
    child: RaisedButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 3,
      onPressed: function,
      color: Color.fromARGB(255, 226, 11, 48),
      child: Text(
        nameFunction,
        style: TextStyle(
          color: Colors.white,
          fontFamily: 'Roboto', //#TODO  postaviti ROBOTO medium
          fontSize: 14,
        ),
      ),
    ),
  );
}

//all white button, used as toggle between signin and register pages
SizedBox buttons(String text, dynamic function) {
  return SizedBox(
    height: 50,
    width: 250,
    child: RaisedButton(
      elevation: 0,
      onPressed: function,
      color: Color.fromARGB(255, 225, 255, 255),
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontFamily: 'Roboto', //#TODO  postaviti ROBOTO medium
          fontSize: 14,
        ),
      ),
    ),
  );
}

//back button for ios //route AnonymousHome
IconButton backButtonIphone(BuildContext context) {
  return IconButton(
      icon: Icon(
        Icons.clear,
        color: Colors.black,
        size: 30,
      ),
      onPressed: () =>
          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) {
            return AnonymousHome();
          })));
}

//back button for ios //route RegisteredHome
IconButton newInputBackButtonIphone(BuildContext context) {
  return IconButton(
      icon: Icon(
        Icons.clear,
        color: Colors.black,
        size: 30,
      ),
      /*
    onPressed: () => Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) {
        return RegisteredHome();
      }),
    ),*/
      onPressed: () {
        img1 = immutableImg1;
        img2 = immutableImg2;
        img3 = immutableImg3;
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) {
            return RegisteredHome();
          }),
        );
      });
}

//buttons for image upload located in imagePageWidget
Container imageOneUploadButton(dynamic function) {
  buttonOne = true;
  return Container(
    alignment: Alignment.centerLeft,
    margin: EdgeInsets.only(left: 35.0),
    child: FlatButton.icon(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
        side: BorderSide(
          color: Colors.white,
          style: BorderStyle.solid,
        ),
      ),
      icon: Icon(
        Icons.add_circle,
        color: Colors.black,
        size: 25,
      ),
      label: AddImageOne(),
      onPressed: function,
    ),
  );
}

//buttons for image upload located in imagePageWidget
Container imageTwoUploadButton(dynamic function) {
  buttonTwo = true;
  return Container(
    alignment: Alignment.centerLeft,
    margin: EdgeInsets.only(left: 35.0),
    child: FlatButton.icon(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
        side: BorderSide(
          color: Colors.white,
          style: BorderStyle.solid,
        ),
      ),
      icon: Icon(
        Icons.add_circle,
        color: Colors.black,
        size: 25,
      ),
      label: AddImageTwo(),
      onPressed: function,
    ),
  );
}

//buttons for image upload located in imagePageWidget
Container imageThreeUploadButton(dynamic function) {
  buttonThree = true;
  return Container(
    alignment: Alignment.centerLeft,
    margin: EdgeInsets.only(left: 35.0),
    child: FlatButton.icon(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
        side: BorderSide(
          color: Colors.white,
          style: BorderStyle.solid,
        ),
      ),
      icon: Icon(
        Icons.add_circle,
        color: Colors.black,
        size: 25,
      ),
      label: AddImageThree(),
      onPressed: function,
    ),
  );
}

//transition used in anonymous screen
class FadeRoute extends PageRouteBuilder {
  final Widget page;
  FadeRoute({this.page})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              page,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              FadeTransition(
            opacity: animation,
            child: child,
          ),
        );
}
