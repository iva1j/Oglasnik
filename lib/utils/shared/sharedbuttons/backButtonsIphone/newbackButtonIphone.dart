import 'package:Oglasnik/view/RegisterHome/pages/registeredHome.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../strings.dart';

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
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => RegisteredHome()),
            (Route<dynamic> route) =>
                false); // obrise sve routes prije ove na koju pusha
      });
}
