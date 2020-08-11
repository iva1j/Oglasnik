import 'package:Oglasnik/utils/transitionFade.dart';
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
      onPressed: () {
        Navigator.of(context).pushAndRemoveUntil(
            FadeRoute(page: RegisteredHome()),
            (Route<dynamic> route) =>
                false); // obrise sve routes prije ove na koju pusha
      });
}
