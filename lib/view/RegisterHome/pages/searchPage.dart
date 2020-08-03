import 'package:Oglasnik/utils/shared/globalVariables.dart';
import 'package:Oglasnik/utils/sizeconfig.dart';
import 'package:Oglasnik/view/AnonymousHome/widgets/bottomSheet.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/ProductsCards/categoryLoading.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/ProductsCards/itemCardDetails/itemCardDescription.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/ProductsCards/itemCardDetails/itemCardImage.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/ProductsCards/itemCardDetails/itemCardPrice.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/ProductsCards/itemCardDetails/itemCardProductName.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/ProductsCards/itemCardDetails/itemCardTags.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/mainFloatingButton.dart';
import 'package:flutter/material.dart';
import 'package:Oglasnik/view/AnonymousHome/widgets/homeFloatingButton.dart';
import 'package:Oglasnik/utils/transitionFade.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/ProductsCards/productDetails.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DataSearch extends SearchDelegate<String> {
  @override
  String get searchFieldLabel => "Pretraga proizvoda...";

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        color: Colors.white,
        onPressed: () {
          query = "";
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
        color: Colors.white,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<DocumentSnapshot> products = List<DocumentSnapshot>();
    List<DocumentSnapshot> selectedProducts = List<DocumentSnapshot>();

    return Scaffold(
      floatingActionButton: email != null
          ? mainFloatingButton(email)
          : homeFloatingAnimatedButton(),
      bottomSheet: BottomSheetContainer(),
      body: Column(children: <Widget>[
        Expanded(
          child: FutureBuilder(
              future: Firestore.instance.collection('products').getDocuments(),
              builder: (BuildContext context, AsyncSnapshot snapshott) {
                if (snapshott.hasData) {
                  products = snapshott.data.documents;
                  products.forEach((element) {
                    if (element['productName']
                        .toLowerCase()
                        .startsWith(query.toLowerCase()))
                      selectedProducts.add(element);
                  });
                  selectedProducts.forEach((element) {
                    print(element['productName']);
                  });
                  if (selectedProducts == null || selectedProducts.isEmpty) {
                    return Center(
                      child: Text('U bazi trenutno nemamo traženi proizvod'),
                    );
                  } else {
                    return Container(
                      padding: EdgeInsets.only(bottom: 55),
                      child: ListView.builder(
                        itemCount: selectedProducts.length,
                        itemBuilder: (_, int index) {
                          return Material(
                            color: Colors.transparent,
                            child: InkWell(
                              splashColor: Colors.transparent,
                              onTap: () {
                                Navigator.of(context).push(
                                  FadeRoute(
                                    page: ProductDetails(
                                      productNameScreen: selectedProducts[index]
                                          ['productName'],
                                      // snapshot
                                      //     .data.documents[index]['productName'],
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: <Widget>[
                                        Expanded(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: <Widget>[
                                              itemCardProductName(context,
                                                  selectedProducts[index]),
                                              Container(
                                                  width: 170,
                                                  margin: EdgeInsets.only(
                                                    right: SizeConfig
                                                            .blockSizeVertical *
                                                        2,
                                                  ),
                                                  child: itemCardDescription(
                                                      selectedProducts[index])),
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.stretch,
                                            children: <Widget>[
                                              itemCardImage(
                                                  selectedProducts[index]),
                                              itemCardPrice(
                                                  selectedProducts[index]),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    Divider(
                                      thickness:
                                          SizeConfig.blockSizeVertical * 0.2,
                                    ),
                                    itemCardTags(selectedProducts[index]),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  }
                } else {
                  return CategoryLoading();
                }
              }),
        )
      ]),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container();
  }
}
