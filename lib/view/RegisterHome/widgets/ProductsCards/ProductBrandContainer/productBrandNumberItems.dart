import 'package:Oglasnik/utils/shared/globalVariables.dart';
import 'package:Oglasnik/utils/sizeconfig.dart';
import 'package:flutter/material.dart';

Container productBrandNumberItems(AsyncSnapshot snapshott, int index) {
  return Container(
      margin: EdgeInsets.only(
        left: SizeConfig.blockSizeHorizontal * 3,
        top: SizeConfig.blockSizeVertical * 1,
      ),
      child: Text('U ovoj kategoriji nalazi se ' +
          snapshott.data.toString() +
          ' ' +
          categoryBrand[index].productBrand +
          '.'));
}
