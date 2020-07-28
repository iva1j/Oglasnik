import 'package:Oglasnik/utils/colors_and_themes/colors.dart';
import 'package:Oglasnik/utils/shared/globalVariables.dart';
import 'package:Oglasnik/utils/sizeconfig.dart';
import 'package:Oglasnik/utils/strings.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/successDialogButtons.dart';
import 'package:flutter/material.dart';

AlertDialog successOnCreateAlertDialog(BuildContext context) {
  showIphoneButton = true;
  return new AlertDialog(
    title: Text(
      SuccessAlertDialog().cestitamo,
      style: TextStyle(color: mainAppColor),
    ),
    content: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          child: Column(
            children: [
              Text(
                SuccessAlertDialog().opis3,
                style: TextStyle(color: alertDialogTextColor),
              ),
              Container(
                margin: EdgeInsets.only(
                  top: SizeConfig.blockSizeVertical * 3,
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    SuccessAlertDialog().opis2,
                    style: TextStyle(color: alertDialogTextColor),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
    backgroundColor: successDialogBgColor,
    elevation: 10,
    actions: <Widget>[
      Container(
        width: double.maxFinite,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(
                right: SizeConfig.blockSizeHorizontal * 5,
              ),
              child: UreduButtonDialog(),
            ),
          ],
        ),
      )
    ],
  );
}
