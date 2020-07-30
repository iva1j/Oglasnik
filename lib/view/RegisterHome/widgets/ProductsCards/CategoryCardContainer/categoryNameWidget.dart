import 'package:Oglasnik/view/RegisterHome/widgets/ProductsCards/categoryCard.dart';

import 'package:flutter/material.dart';
import 'package:Oglasnik/utils/sizeconfig.dart';

Container categoryNameWidget(int index) {
  return Container(
    margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical),
    child: Text(
      categories[index].categoryName,
      style: TextStyle(
        fontSize: SizeConfig.safeBlockHorizontal * 5,
        fontWeight: FontWeight.w700,
      ),
    ),
  );
}
