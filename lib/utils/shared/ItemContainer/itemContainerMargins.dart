import 'package:Oglasnik/utils/sizeconfig.dart';
import 'package:flutter/material.dart';

EdgeInsets itemContainerMargins() {
  return EdgeInsets.only(
    left: SizeConfig.blockSizeHorizontal * 5,
    right: SizeConfig.blockSizeHorizontal * 5,
    top: SizeConfig.blockSizeVertical * 4,
    bottom: SizeConfig.blockSizeVertical * 2,
  );
}
