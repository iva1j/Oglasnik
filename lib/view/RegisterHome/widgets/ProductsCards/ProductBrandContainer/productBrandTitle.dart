import 'package:Oglasnik/utils/shared/globalVariables.dart';
import 'package:Oglasnik/utils/sizeconfig.dart';
import 'package:Oglasnik/utils/transitionFade.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/ProductsCards/itemCard.dart';
import 'package:flutter/material.dart';

Container productBrandTitle(BuildContext context, int index) {
  return Container(
    margin: EdgeInsets.only(
      left: SizeConfig.blockSizeHorizontal * 3,
      top: SizeConfig.blockSizeVertical * 2,
    ),
    child: Material(
      color: Colors.transparent,
      child: InkWell(
        splashColor: Colors.transparent,
        onTap: () {
          Navigator.of(context).push(
            FadeRoute(
              page: ItemCard(
                brandNameScreen: categoryBrand[index].productBrand,
              ),
            ),
          );
        },
        child: Text(
          categoryBrand[index].productBrand,
          style: TextStyle(
            fontSize: SizeConfig.safeBlockHorizontal * 5,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    ),
  );
}
