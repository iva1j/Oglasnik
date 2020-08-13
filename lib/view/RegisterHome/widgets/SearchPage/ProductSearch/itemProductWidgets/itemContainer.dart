import 'package:Oglasnik/utils/colors_and_themes/colors.dart';
import 'package:Oglasnik/utils/shared/ItemContainer/itemContainerDecoration.dart';
import 'package:Oglasnik/utils/shared/ItemContainer/itemContainerMargins.dart';
import 'package:Oglasnik/utils/shared/globalVariables.dart';
import 'package:Oglasnik/utils/sizeconfig.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/ProductsCards/itemCardDetails/itemCardImage.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/ProductsCards/itemCardDetails/itemCardPrice.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/ProductsCards/itemCardDetails/itemCardProductName.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/ProductsCards/itemCardDetails/itemCardTags.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/SearchPage/ProductSearch/itemProductWidgets/itemCardDesc.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/SearchPage/ProductSearch/itemProductWidgets/itemProductContainer.dart';
import 'package:Oglasnik/viewModel/FavoriteProduct/favoriteProductViewModel.dart';
import 'package:flutter/material.dart';

Container itemContainer(
    BuildContext context, int index, Function setStateParent) {
  return Container(
    decoration: itemContainerDecoration(),
    margin: itemContainerMargins(),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  itemCardProductName(
                      context, selectedProducts[index], setStateParent),
                  itemCardDesc(index),
                ],
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  itemCardImage(selectedProducts[index]),
                  itemCardPrice(selectedProducts[index]),
                ],
              ),
            ),
          ],
        ),
        Divider(
          thickness: SizeConfig.blockSizeVertical * 0.2,
        ),
        //itemCardTags(selectedProducts[index]),
        email != null
            ? Row(
                children: <Widget>[
                  itemCardTags(selectedProducts[index]),
                  Container(
                    child: IconButton(
                        color: Colors.white,
                        icon: favoritesList
                                .contains(selectedProducts[index]['productID'])
                            ? Icon(
                                Icons.star,
                                size: 30,
                                color: mainAppColor,
                              )
                            : Icon(Icons.star_border,
                                size: 30, color: starBorderColor),
                        onPressed: () async {
                          final result = favoritesList
                              .contains(selectedProducts[index]['productID']);
                          if (result) {
                            favoritesList
                                .remove(selectedProducts[index]['productID']);
                            await FavoriteProduct()
                                .removeFavorite(email, selectedProducts[index]);
                            setStateParent();
                          } else {
                            favoritesList
                                .add(selectedProducts[index]['productID']);
                            await FavoriteProduct()
                                .addFavorite(email, selectedProducts[index]);
                            setStateParent();
                          }
                        }),
                  ),
                ],
              )
            : itemCardTags(selectedProducts[index]),
      ],
    ),
  );
}
