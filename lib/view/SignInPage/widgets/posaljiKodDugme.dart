import 'package:Oglasnik/utils/colors_and_themes/colors.dart';

import 'package:Oglasnik/viewModel/SignIn/SignInViewModel.dart';
import 'package:flutter/material.dart';

class PosaljiKodDugme extends StatelessWidget {
  const PosaljiKodDugme({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FlatButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(2.0)),
          color: mainAppColor,
          child: Text(
            'POŠALJI KOD',
            style: TextStyle(
                color: Colors.white, fontFamily: 'Roboto', fontSize: 14),
          ),
          onPressed: () {
            onPressedPosaljiKod(context);
          }),
    );
  }
}
