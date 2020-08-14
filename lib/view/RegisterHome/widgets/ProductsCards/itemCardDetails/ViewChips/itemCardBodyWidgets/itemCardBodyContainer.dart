import 'package:Oglasnik/utils/strings.dart';
import 'package:Oglasnik/utils/suggestionFunction.dart';
import 'package:Oglasnik/utils/transitionFade.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/ProductsCards/itemCardDetails/ViewChips/itemCardBodyWidgets/itemCardContainer1.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/ProductsCards/itemCardDetails/itemCardBody.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/ProductsCards/productDetails.dart';
import 'package:flutter/material.dart';
import 'package:Oglasnik/utils/sizeconfig.dart';
import 'package:Oglasnik/utils/shared/globalVariables.dart';
import 'package:Oglasnik/utils/strings.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/ProductsCards/itemCardDetails/ViewChips/itemCardBodyWidgets/itemCardBodyDesc.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/ProductsCards/itemCardDetails/itemCardImage.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/ProductsCards/itemCardDetails/itemCardPrice.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/ProductsCards/itemCardDetails/itemCardProductName.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/ProductsCards/itemCardDetails/itemCardTags.dart';
import 'package:Oglasnik/viewModel/FavoriteProduct/favoriteProductViewModel.dart';
import 'package:Oglasnik/utils/colors_and_themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:Oglasnik/utils/sizeconfig.dart';

class ItemCardBodyContainer extends StatefulWidget {
  const ItemCardBodyContainer({
    Key key,
    @required this.snapshot,
    @required this.context,
    @required this.setStateParent,
  }) : super(key: key);

  final AsyncSnapshot snapshot;
  final BuildContext context;
  final Function setStateParent;

  @override
  _ItemCardBodyContainerState createState() => _ItemCardBodyContainerState();
}

class _ItemCardBodyContainerState extends State<ItemCardBodyContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 55),
      child: ListView.builder(
        itemCount: widget.snapshot.data.documents.length,
        itemBuilder: (_, int index) {
          if (index == widget.snapshot.data.documents.length - 1) {
            if (locationIsSelected(
                widget.snapshot.data.documents[index]['productLocation'],
                selectedChips)) {
              showMessage = false;

              return Material(
                color: Colors.transparent,
                child:

                    /*ItemCardContainer1(
                  context: context,
                  snapshot: widget.snapshot,
                  index: index,
                  setStateParent: widget.setStateParent,
                ),
*/
                    InkWell(
                  splashColor: Colors.transparent,
                  onTap: () {
                    Navigator.of(context).push(
                      FadeRoute(
                        page: ProductDetails(
                          productNameScreen: widget
                              .snapshot.data.documents[index]['productName'],
                          productIdScreen: widget.snapshot.data.documents[index]
                              ['productID'],
                          setStateParent: widget.setStateParent,
                        ),
                      ),
                    );
                  },
                  //child: itemCardContainer1(context, widget.snapshot, index),
                  child: ItemCardContainer1(
                    context: context,
                    snapshot: widget.snapshot,
                    index: index,
                    setStateParent: widget.setStateParent,
                  ),
                ),
              );
            } else if (showMessage == true) {
              return Container(
                  height: SizeConfig.blockSizeVertical * 60,
                  child: Center(child: Text(EmptyProductList().emptyList)));
            } else {
              return Container();
            }
          } else {
            if (locationIsSelected(
                widget.snapshot.data.documents[index]['productLocation'],
                selectedChips)) {
              showMessage = false;

              return Material(
                color: Colors.transparent,
                child:

                    /*ItemCardContainer1(
                  context: context,
                  snapshot: widget.snapshot,
                  index: index,
                  setStateParent: widget.setStateParent,
                ),
*/
                    InkWell(
                  splashColor: Colors.transparent,
                  onTap: () {
                    Navigator.of(context).push(
                      FadeRoute(
                        page: ProductDetails(
                            productNameScreen: widget
                                .snapshot.data.documents[index]['productName'],
                            productIdScreen: widget
                                .snapshot.data.documents[index]['productID'],
                            setStateParent: widget.setStateParent),
                      ),
                    );
                  },
                  child: ItemCardContainer1(
                    context: context,
                    snapshot: widget.snapshot,
                    index: index,
                    setStateParent: widget.setStateParent,
                  ),
                  //child: itemCardContainer1(context, widget.snapshot, index),
                ),
              );
            } else {
              return Container();
            }
          }
        },
      ),
    );
  }
}
