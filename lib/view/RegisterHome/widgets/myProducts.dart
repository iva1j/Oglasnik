import 'package:Oglasnik/utils/shared/ItemContainer/itemContainerDecoration.dart';
import 'package:Oglasnik/utils/shared/ItemContainer/itemContainerMargins.dart';
import 'package:Oglasnik/utils/shared/globalVariables.dart';
import 'package:Oglasnik/utils/sizeconfig.dart';
import 'package:Oglasnik/utils/strings.dart';
import 'package:Oglasnik/utils/transitionFade.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'ProductsCards/categoryLoading.dart';
import 'ProductsCards/itemCardDetails/itemCardPrice.dart';
import 'ProductsCards/itemCardDetails/itemCardTags.dart';
import 'ProductsCards/productDetails.dart';
import 'package:Oglasnik/utils/suggestionFunction.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/ProductsCards/categoryLoading.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/ProductsCards/itemCardDetails/itemCardBody.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/ProductsCards/itemCardDetails/itemCardDescription.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/ProductsCards/itemCardDetails/itemCardImage.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/ProductsCards/itemCardDetails/itemCardPrice.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/ProductsCards/itemCardDetails/itemCardProductName.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/ProductsCards/itemCardDetails/itemCardTags.dart';

import 'package:Oglasnik/view/RegisterHome/widgets/ProductsCards/productDetails.dart';

List<DocumentSnapshot> myPosts = List<DocumentSnapshot>();
List myProducts = [];

class MyProducts extends StatelessWidget {
  bool showMessage = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          child: 
          FutureBuilder(
            future: Firestore.instance
                .collection('products')
                .where('email', isEqualTo: email)
                .where('productFinished', isEqualTo: false)
                .getDocuments(),
            builder: (BuildContext context, AsyncSnapshot snapshott) {
              if (snapshott.hasData) {
                myPosts.clear();
                myProducts.clear();
                myPosts = snapshott.data.documents;
                myPosts.forEach((element) {
                  myProducts.add(element['productName']);
                });
                print("Lista mojih proizvoda: " + myPosts.toString());

                return myPosts == null || myPosts.isEmpty
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Center(
                            child: Text(TrazeniProizvod().nemaProizvoda),
                          )
                        ],
                      )
                    : Container(
                        padding: EdgeInsets.only(bottom: 55),
                        child: ListView.builder(
                          itemCount: myPosts.length,
                          itemBuilder: (_, int index) {
                            if (index == myPosts.length - 1) {
                              if (locationIsSelected(
                                  myPosts[index]['productLocation'],
                                  selectedChips)) {
                                showMessage = false;

                                return Material(
                                  color: Colors.transparent,
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    onTap: () {
                                      itemProductName(context, index);
                                    },
                                    child: Container(
                                      decoration: itemContainerDecoration(),
                                      margin: itemContainerMargins(),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
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
                                                        myPosts[index]),
                                                    Container(
                                                      width: SizeConfig
                                                              .blockSizeHorizontal *
                                                          53,
                                                      margin: EdgeInsets.only(
                                                        right: SizeConfig
                                                                .blockSizeVertical *
                                                            2,
                                                      ),

                                                      ///gledamo da li je duzina opisa nekog artikla manja od 150, u slucaju da
                                                      ///jeste onda ga jednostavno ispisujemo u item card-u. Ako nije onda
                                                      ///uzimamo njegovih prvih 150 character-a, uklanjamo whitespace-ove
                                                      ///i dodajemo mu ... na kraj.
                                                      child: myPosts[index]['productDesc']
                                                                  .toString()
                                                                  .trim()
                                                                  .length <
                                                              150
                                                          ? itemCardDescription(
                                                              myPosts[index][
                                                                  'productDesc'])
                                                          : myPosts[index]['productDesc']
                                                                  .toString()
                                                                  .trim()
                                                                  .substring(
                                                                      0, 150)
                                                                  .contains('.')
                                                              ? itemCardDescription(myPosts[index]['productDesc']
                                                                      .toString()
                                                                      .substring(
                                                                          0,
                                                                          myPosts[index]['productDesc'].toString().substring(0, 150).lastIndexOf('.'))
                                                                      .trim() +
                                                                  "...")
                                                              : itemCardDescription(myPosts[index]['productDesc'].toString().substring(0, 150) + '...'),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Expanded(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment
                                                          .stretch,
                                                  children: <Widget>[
                                                    itemCardImage(
                                                        myPosts[index]),
                                                    itemCardPrice(
                                                        myPosts[index]),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                          Divider(
                                            thickness:
                                                SizeConfig.blockSizeVertical *
                                                    0.2,
                                          ),
                                          itemCardTags(myPosts[index]),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              } else if (showMessage == true) {
                                return Container(
                                    margin: EdgeInsets.symmetric(
                                        vertical:
                                            SizeConfig.blockSizeVertical * 30),
                                    child: Center(
                                        child: Text(
                                            EmptyProductList().emptyList)));
                              } else {
                                return Container();
                              }
                            } else {
                              if (locationIsSelected(
                                  myPosts[index]['productLocation'],
                                  selectedChips)) {
                                showMessage = false;

                                return Material(
                                  color: Colors.transparent,
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    onTap: () {
                                      itemProductName(context, index);
                                    },
                                    child: Container(
                                      decoration: itemContainerDecoration(),
                                      margin: itemContainerMargins(),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
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
                                                        myPosts[index]),
                                                    Container(
                                                      width: SizeConfig
                                                              .blockSizeHorizontal *
                                                          53,
                                                      margin: EdgeInsets.only(
                                                        right: SizeConfig
                                                                .blockSizeVertical *
                                                            2,
                                                      ),
                                                      child: myPosts[index]['productDesc']
                                                                  .toString()
                                                                  .trim()
                                                                  .length <
                                                              150
                                                          ? itemCardDescription(
                                                              myPosts[index][
                                                                  'productDesc'])
                                                          : myPosts[index]['productDesc']
                                                                  .toString()
                                                                  .trim()
                                                                  .substring(
                                                                      0, 150)
                                                                  .contains('.')
                                                              ? itemCardDescription(myPosts[index]['productDesc']
                                                                      .toString()
                                                                      .substring(
                                                                          0,
                                                                          myPosts[index]['productDesc'].toString().substring(0, 150).lastIndexOf('.'))
                                                                      .trim() +
                                                                  "...")
                                                              : itemCardDescription(myPosts[index]['productDesc'].toString().substring(0, 150) + '...'),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Expanded(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment
                                                          .stretch,
                                                  children: <Widget>[
                                                    itemCardImage(
                                                        myPosts[index]),
                                                    itemCardPrice(
                                                        myPosts[index]),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                          Divider(
                                            thickness:
                                                SizeConfig.blockSizeVertical *
                                                    0.2,
                                          ),
                                          itemCardTags(myPosts[index]),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              } else {
                                return Container();
                              }
                            }
                          },
                        ),
                      );
                ;
              } else {
                return CategoryLoading();
              }
            },
          ),
        ),
      ],
    );
  }

  void itemProductName(BuildContext context, int index) {
    Navigator.of(context).push(
      FadeRoute(
        page: ProductDetails(
            productNameScreen: myPosts[index]['productName'],
            productIdScreen: myPosts[index]['productID']
            // snapshot
            //     .data.documents[index]['productName'],
            ),
      ),
    );
  }
}
