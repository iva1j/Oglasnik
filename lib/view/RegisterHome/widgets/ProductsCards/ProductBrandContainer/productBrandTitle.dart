import 'package:Oglasnik/utils/shared/globalVariables.dart';
import 'package:Oglasnik/utils/sizeconfig.dart';

import 'package:flutter/material.dart';

Container productBrandTitle(BuildContext context, int index) {
  return Container(
    margin: EdgeInsets.only(
      left: SizeConfig.blockSizeHorizontal * 3,
      top: SizeConfig.blockSizeVertical * 2,
    ),
    child: Material(
      color: Colors.transparent,
      child: Text(
        categoryBrand[index].productBrand,
        style: TextStyle(
          fontSize: SizeConfig.safeBlockHorizontal * 5,
          fontWeight: FontWeight.w500,
        ),
      ),
    ),
  );
}
