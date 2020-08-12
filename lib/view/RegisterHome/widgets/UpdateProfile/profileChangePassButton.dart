import 'package:Oglasnik/utils/shared/sharedbuttons/mainAppButtons/lightPinkButton.dart';
import 'package:Oglasnik/utils/sizeconfig.dart';
import 'package:flutter/material.dart';

class ProfileChangePassButton extends StatelessWidget {
  const ProfileChangePassButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          left: SizeConfig.blockSizeHorizontal * 12,
          top: SizeConfig.blockSizeVertical * 4),
      child: lightbutton(
        'Promijeni šifru',
        () {},
      ),
    );
  }
}
