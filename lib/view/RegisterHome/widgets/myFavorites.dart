import 'package:Oglasnik/utils/shared/globalVariables.dart';
import 'package:Oglasnik/utils/sizeconfig.dart';
import 'package:Oglasnik/utils/strings.dart';
import 'package:Oglasnik/utils/transitionFade.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/ProductsCards/itemCardDetails/ViewChips/itemCardBodyWidgets/itemCardBodyDesc.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/ProductsCards/itemCardDetails/ViewChips/itemCardBodyWidgets/itemCardContainer1.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/ProductsCards/itemCardDetails/itemCardImage.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/ProductsCards/itemCardDetails/itemCardPrice.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/ProductsCards/itemCardDetails/itemCardProductName.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/ProductsCards/itemCardDetails/itemCardTags.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/ProductsCards/productDetails.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/spinnerCircular.dart';
import 'package:Oglasnik/viewModel/FavoriteProduct/favoriteProductViewModel.dart';
import 'package:flutter/material.dart';

class MyFavorites extends StatefulWidget {
  @override
  _MyFavoritesState createState() => _MyFavoritesState();
}

class _MyFavoritesState extends State<MyFavorites> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: FavoriteProduct().listAllFavorites(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Container(
              child: Center(
                child: SpinnerCircular(),
              ),
            );
          } else {
            return Container(
              padding: EdgeInsets.only(bottom: 55),
              child: snapshot.data.length == null
                  ? Center(child: Text("Nemate sacuvanih proizvoda."))
                  : ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (_, int index) {
                        return Material(
                          color: Colors.transparent,
                          child: InkWell(
                            splashColor: Colors.transparent,
                            onTap: () {
                              Navigator.of(context).push(
                                FadeRoute(
                                  page: ProductDetails(
                                    productNameScreen: snapshot.data[index]
                                        ['productName'],
                                    productIdScreen: snapshot.data[index]
                                        ['productID'],
                                  ),
                                ),
                              );
                            },
                            child: Container(
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Expanded(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: <Widget>[
                                            itemCardProductName(
                                                context, snapshot.data[index]),
                                            itemCardBodyDesc(
                                                snapshot.data[index], index),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
                                          children: <Widget>[
                                            itemCardImage(snapshot.data[index]),
                                            itemCardPrice(snapshot.data[index]),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Divider(
                                    thickness:
                                        SizeConfig.blockSizeVertical * 0.2,
                                  ),
                                  email != null
                                      ? Row(
                                          // crossAxisAlignment: CrossAxisAlignment.center,
                                          // mainAxisAlignment: MainAxisAlignment.center,
                                          children: <Widget>[
                                            itemCardTags(snapshot.data[
                                                index]), /*
                                              Container(
                                                margin:
                                                    EdgeInsets.only(bottom: 5),
                                                child: IconButton(
                                                    color: Colors.white,
                                                    icon: Icon(
                                                      Icons.star,
                                                      size: 30,
                                                      color: favorite
                                                          ? Colors.yellow
                                                          : Colors.red,
                                                    ),
                                                    onPressed: () async {
                                                      FavoriteProduct()
                                                          .removeFavorite(email,
                                                              products[index]);
                                                      FavoriteProduct()
                                                          .isProductFavorite(
                                                              products[index]);
                                                    }),
                                              ),*/
                                          ],
                                        )
                                      : itemCardTags(snapshot.data[index]),
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
            );
          }
        });
  }
}
