import 'package:Oglasnik/utils/shared/globalVariables.dart';
import 'package:Oglasnik/utils/strings.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/ProductsCards/itemCardDetails/ViewChips/itemCardBodyWidgets/itemCardBodyDesc.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/ProductsCards/itemCardDetails/itemCardImage.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/ProductsCards/itemCardDetails/itemCardPrice.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/ProductsCards/itemCardDetails/itemCardProductName.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/ProductsCards/itemCardDetails/itemCardTags.dart';
import 'package:Oglasnik/viewModel/FavoriteProduct/favoriteProductViewModel.dart';
import 'package:Oglasnik/utils/colors_and_themes/colors.dart';
import 'package:Oglasnik/viewModel/SplashViewModel/splashViewModel.dart';
import 'package:flutter/material.dart';
import 'package:Oglasnik/utils/sizeconfig.dart';

class ItemCardContainer1 extends StatefulWidget {
  const ItemCardContainer1({
    Key key,
    this.context,
    this.snapshot,
    this.index,
  }) : super(key: key);
  final BuildContext context;
  final AsyncSnapshot snapshot;
  final int index;
  @override
  _ItemCardContainer1State createState() => _ItemCardContainer1State();
}

class _ItemCardContainer1State extends State<ItemCardContainer1> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 7,
            offset: Offset(0, 3),
          ),
        ],
        border: Border.all(
          color: Colors.black26,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(4),
        ),
      ),
      margin: EdgeInsets.only(
        left: SizeConfig.blockSizeHorizontal * 5,
        right: SizeConfig.blockSizeHorizontal * 5,
        top: SizeConfig.blockSizeVertical * 4,
        bottom: SizeConfig.blockSizeVertical * 2,
      ),
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
                        context, widget.snapshot.data.documents[widget.index]),
                    itemCardBodyDesc(
                        widget.snapshot.data.documents[widget.index],
                        widget.index),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    itemCardImage(widget.snapshot.data.documents[widget.index]),
                    itemCardPrice(widget.snapshot.data.documents[widget.index]),
                  ],
                ),
              ),
            ],
          ),
          Divider(
            thickness: SizeConfig.blockSizeVertical * 0.2,
          ),
          email != null
              ? Row(
                  children: <Widget>[
                    itemCardTags(widget.snapshot.data.documents[widget.index]),
                    Container(
                      margin: EdgeInsets.only(bottom: 5),
                      child: IconButton(
                          color: Colors.white,
                          icon: favorite
                              ? Icon(
                                  Icons.star_border,
                                  size: 30,
                                  color: starBorderColor,
                                )
                              : Icon(Icons.star, size: 30, color: mainAppColor),
                          onPressed: () async {
                            FavoriteProduct()
                                .isProductFavorite(products[widget.index]);
                            setState(() {
                              getFavoriteProducts(email);
                            });
                          }),
                    ),
                  ],
                )
              : itemCardTags(widget.snapshot.data.documents[widget.index]),
        ],
      ),
    );
  }
}
