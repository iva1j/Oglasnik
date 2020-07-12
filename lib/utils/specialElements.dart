import 'package:Oglasnik/view/AnonymousHome/pages/anonymousHome.dart';
import 'package:flutter/material.dart';
import 'package:Oglasnik/view/RegisterHome/pages/registeredHome.dart';

SizedBox button(dynamic nameFunction, dynamic function) {
  return SizedBox(
    height: 50,
    width: 250,
    child: RaisedButton(
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

IconButton newInputBackButtonIphone(BuildContext context) {
  return IconButton(
      icon: Icon(
        Icons.clear,
        color: Colors.black,
        size: 30,
      ),
      onPressed: () =>
          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) {
            return RegisteredHome();
          })));
}

Container imageOneUploadButton(dynamic function) {
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
      label: Text(
        'Dodaj sliku 1',
        style: TextStyle(
          fontSize: 12.0,
          fontWeight: FontWeight.normal,
        ),
      ),
      onPressed: function,
    ),
  );
}

Container imageTwoUploadButton(dynamic function) {
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
      label: Text(
        'Dodaj sliku 2',
        style: TextStyle(
          fontSize: 12.0,
          fontWeight: FontWeight.normal,
        ),
      ),
      onPressed: function,
    ),
  );
}

Container imageThreeUploadButton(dynamic function) {
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
      label: Text(
        'Dodaj sliku 3',
        style: TextStyle(
          fontSize: 12.0,
          fontWeight: FontWeight.normal,
        ),
      ),
      onPressed: function,
    ),
  );
}

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
