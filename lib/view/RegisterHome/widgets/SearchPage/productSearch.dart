import 'package:Oglasnik/utils/shared/ItemContainer/itemContainerDecoration.dart';
import 'package:Oglasnik/utils/shared/ItemContainer/itemContainerMargins.dart';
import 'package:Oglasnik/utils/sizeconfig.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/ProductsCards/categoryLoading.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/ProductsCards/itemCardDetails/itemCardDescription.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/ProductsCards/itemCardDetails/itemCardImage.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/ProductsCards/itemCardDetails/itemCardPrice.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/ProductsCards/itemCardDetails/itemCardProductName.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/ProductsCards/itemCardDetails/itemCardTags.dart';
import 'package:flutter/material.dart';
import 'package:Oglasnik/utils/transitionFade.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/ProductsCards/productDetails.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SearchPageFutureBuilder extends StatelessWidget {
  SearchPageFutureBuilder({
    Key key,
    @required this.query,
    @required this.selectedProducts,
  }) : super(key: key);

  //final List<DocumentSnapshot> products;

  final String query;
  final List<DocumentSnapshot> selectedProducts;

  @override
  Widget build(BuildContext context) {
    List<DocumentSnapshot> products = List<DocumentSnapshot>();

    return FutureBuilder(
      /// Future funkcija koja je zadužena za povlačenje proizvoda iz baze:
      future: Firestore.instance.collection('products').getDocuments(),
      builder: (BuildContext context, AsyncSnapshot snapshott) {
        if (snapshott.hasData) {
          showingSelectedProducts(products, snapshott);

          //Handlovanje slučaja da u bazi nema niti jednog artikla koji je user tražio:
          return selectedProducts == null || selectedProducts.isEmpty
              ? Center(
                  child: Text('U bazi trenutno nemamo traženi proizvod'),
                )
              : Container(
                  padding: EdgeInsets.only(bottom: 55),
                  child: ListView.builder(
                    itemCount: selectedProducts.length,
                    itemBuilder: (_, int index) {
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: <Widget>[
                                          itemCardProductName(
                                              context, selectedProducts[index]),
                                          Container(
                                            width:
                                                SizeConfig.blockSizeHorizontal *
                                                    53,
                                            margin: EdgeInsets.only(
                                              right:
                                                  SizeConfig.blockSizeVertical *
                                                      2,
                                            ),
                                            child: itemCardDescription(
                                              selectedProducts[index],
                                            ),
                                          ),
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
                                  thickness: SizeConfig.blockSizeVertical * 0.2,
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
        } else {
          //prikazivanje spinnera, u slučaju da učitavanje potraje malo duže
          return CategoryLoading();
        }
      },
    );
  }

//popunjavanje liste products
  void showingSelectedProducts(
      List<DocumentSnapshot> products, AsyncSnapshot snapshott) {
    products = snapshott.data.documents;
    /*Korištenjem forEach metode popunjavamo selectedProducts listu, ,na način da userov unos
    u search (query) , poredimo sa 'productName' koji je neki user unio pri kreiranju artikla */
    products.forEach((element) {
      if (element['productName'].toLowerCase().startsWith(
          query.toLowerCase())) //Iva Elvir, omogucuje se ispis artikla bez
        ///obzira da li je user unio veliko ili malo slovo u search
        selectedProducts.add(element);
    });
    selectedProducts.forEach((element) {
      print(element['productName']);
    });
  }

  void itemProductName(BuildContext context, int index) {
    Navigator.of(context).push(
      FadeRoute(
        page: ProductDetails(
          productNameScreen: selectedProducts[index]['productName'],
          // snapshot
          //     .data.documents[index]['productName'],
        ),
      ),
    );
  }
}
