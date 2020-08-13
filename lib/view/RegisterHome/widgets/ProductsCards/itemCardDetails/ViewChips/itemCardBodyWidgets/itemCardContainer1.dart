import 'package:Oglasnik/utils/shared/globalVariables.dart';
import 'package:Oglasnik/utils/strings.dart';
import 'package:Oglasnik/utils/transitionFade.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/ProductsCards/itemCardDetails/ViewChips/itemCardBodyWidgets/itemCardBodyDesc.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/ProductsCards/itemCardDetails/itemCardImage.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/ProductsCards/itemCardDetails/itemCardPrice.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/ProductsCards/itemCardDetails/itemCardProductName.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/ProductsCards/itemCardDetails/itemCardTags.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/ProductsCards/productDetails.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/spinnerCircular.dart';
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
    this.setStateParent,
  }) : super(key: key);
  final BuildContext context;
  final AsyncSnapshot snapshot;
  final int index;
  final Function setStateParent;
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
                        context,
                        widget.snapshot.data.documents[widget.index],
                        widget.setStateParent),
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
                      child: IconButton(
                          color: Colors.white,
                          icon: favoritesList.contains(widget.snapshot.data
                                  .documents[widget.index]['productID'])
                              ? Icon(
                                  Icons.star,
                                  size: 30,
                                  color: mainAppColor,
                                )
                              : Icon(Icons.star_border,
                                  size: 30, color: starBorderColor),
                          onPressed: () async {
                            final result = favoritesList.contains(widget
                                .snapshot
                                .data
                                .documents[widget.index]['productID']);
                            if (result) {
                              favoritesList.remove(widget.snapshot.data
                                  .documents[widget.index]['productID']);
                              await FavoriteProduct().removeFavorite(email,
                                  widget.snapshot.data.documents[widget.index]);
                              widget.setStateParent();
                            } else {
                              favoritesList.add(widget.snapshot.data
                                  .documents[widget.index]['productID']);
                              await FavoriteProduct().addFavorite(email,
                                  widget.snapshot.data.documents[widget.index]);
                              widget.setStateParent();
                            }
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

/*Container(
                      margin: EdgeInsets.only(bottom: 5),
                      child: FutureBuilder(
                        future: FavoriteProduct()
                            .isProductFavorite(products[widget.index]),
                        builder: (context, snapshot2) {
                          if (!snapshot2.hasData) {
                            return SpinnerCircular();
                          } else {
                            return IconButton(
                                color: Colors.white,
                                icon: snapshot2.data == false
                                    ? Icon(
                                        Icons.star_border,
                                        size: 30,
                                        color: starBorderColor,
                                      )
                                    : Icon(Icons.star,
                                        size: 30, color: mainAppColor),
                                onPressed: () async {
                                  // FavoriteProduct().removeFavorite(
                                  //     email, products[index]);
                                  final result = snapshot2.data;
                                  if (result) {
                                    await FavoriteProduct().removeFavorite(
                                        email, products[widget.index]);
                                  } else {
                                    await FavoriteProduct().addFavorite(
                                        email, products[widget.index]);
                                  }
                                  setState(() {});
                                });
                          }
                        },
                      ),
                    ),*/
