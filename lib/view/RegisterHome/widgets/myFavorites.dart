import 'package:Oglasnik/utils/colors_and_themes/colors.dart';
import 'package:Oglasnik/utils/shared/globalVariables.dart';
import 'package:Oglasnik/utils/sizeconfig.dart';
import 'package:Oglasnik/utils/transitionFade.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/ProductsCards/itemCardDetails/ViewChips/itemCardBodyWidgets/itemCardBodyDesc.dart';
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
  void justSetState() {
    setState(() {});
  }

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
              child: snapshot.data.length == 0
                  ? Center(child: Text("Nemate sacuvanih proizvoda."))
                  : ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (_, int index) {
                        return Material(
                          color: Colors.transparent,
                          child: InkWell(
                            splashColor: Colors.transparent,
                            onTap: () {
                              //extract
                              Navigator.of(context).push(
                                FadeRoute(
                                  page: ProductDetails(
                                    productNameScreen: snapshot.data[index]
                                        ['productName'],
                                    productIdScreen: snapshot.data[index]
                                        ['productID'],
                                    setStateParent: justSetState,
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
                                                context,
                                                snapshot.data[index],
                                                justSetState),
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
                                  //extract
                                  email != null
                                      ? Row(
                                          children: <Widget>[
                                            itemCardTags(snapshot.data[index]),
                                            Container(
                                              child: IconButton(
                                                  color: Colors.white,
                                                  icon: favoritesList.contains(
                                                          snapshot.data[index]
                                                              ['productID'])
                                                      ? Icon(
                                                          Icons.star,
                                                          size: 30,
                                                          color: mainAppColor,
                                                        )
                                                      : Icon(Icons.star_border,
                                                          size: 30,
                                                          color:
                                                              starBorderColor),
                                                  //extract
                                                  onPressed: () async {
                                                    final result =
                                                        favoritesList.contains(
                                                            snapshot.data[index]
                                                                ['productID']);
                                                    if (result) {
                                                      favoritesList.remove(
                                                          snapshot.data[index]
                                                              ['productID']);
                                                      await FavoriteProduct()
                                                          .removeFavorite(
                                                              email,
                                                              snapshot
                                                                  .data[index]);
                                                      setState(() {});
                                                    } else {
                                                      favoritesList.add(
                                                          snapshot.data[index]
                                                              ['productID']);
                                                      await FavoriteProduct()
                                                          .addFavorite(
                                                              email,
                                                              snapshot
                                                                  .data[index]);
                                                      setState(() {});
                                                    }
                                                  }),
                                            ),
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
