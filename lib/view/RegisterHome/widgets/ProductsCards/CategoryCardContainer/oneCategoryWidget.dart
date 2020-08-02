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

Column oneCategoryWidget(int index, List<String> names, List counts) {
  return Column(children: <Widget>[
    CategoryCardRow(
      icon: Transform.scale(
        scale: 0.8,
        child: SvgPicture.network(categories[index].icon),
      ),
      name: names[0],
      count: counts[0].toString(),
    ),
  ]);
}
