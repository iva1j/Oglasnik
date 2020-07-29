import 'package:Oglasnik/utils/enterexitTransitionRoutes.dart';
import 'package:Oglasnik/utils/transitionFade.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/ProductsCards/categoryCard.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/ProductsCards/productBrandCard.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/categoryCardRow.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/spinnerCircular.dart';
import 'package:Oglasnik/viewModel/PreviewProduct/topBrands.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
