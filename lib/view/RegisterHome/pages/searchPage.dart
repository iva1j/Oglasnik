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

/// Na ovom dijelu koda radili Iva i Elvir
/// Kreiranje SearchDelegate klase sa njenim funkcijama koje cemo koristiti za kreiranje searcha,
//buildactions,buildLeading,buildresults,buildSuggestions
class DataSearch extends SearchDelegate<String> {
  @override
  String get searchFieldLabel =>
      "Pretraga proizvoda..."; // Iva i Elvir, promjena teksta na search baru +
  ///dodatne promjene u search biblioteci searchdelegate klase.Sve promjene vezane za dizajn su u biblioteci.
  /// U narednim linijama code-a (200, 209) u searchu.dart biblioteka moralo je doci do izmjena da bi search bar bio u skladu sa nasom aplikacijom
  /// Izmjene su se morale odraditi direktno u klasi SearchDelegate
  /// Izmjene se ticu promjene boje bara, boje ikona, boje title-a
  /// Plus izmjena boje kursora na liniji 538
  /// Task radili: Elvir i Iva
  @override
  List<Widget> buildActions(BuildContext context) {
    ///Iva Elvir kreiranje buildAction funkcije
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

  ///Iva Elvir kreiranje buildLeadingfunkcije
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
    //Na ovom dijelu koda (buildResults) su radili : Faruk, Fahrudin i Amer
    /*OPIS LOGIKE: Kao što vidimo , definisane su dvije liste : products i selectedProducts.
    Ove dvije liste ćemo koristiti kako bi useru prikazali artikle koje on pretražuje na način da
    ćemo u listi products imati storane naše proizvode iz baze, a u listu selectedProduct ćemo puniti na osnovu toga šta
    user ukuca u search, te na osnovu te liste ćemo prikazivati željene produkte na screen. */
    List<DocumentSnapshot> products = List<DocumentSnapshot>();
    List<DocumentSnapshot> selectedProducts = List<DocumentSnapshot>();

    return Scaffold(
      floatingActionButton: email != null
          ? mainFloatingButton(email)
          : homeFloatingAnimatedButton(),
      bottomSheet: BottomSheetContainer(),
      body: Column(
        children: <Widget>[
          Expanded(
            child: FutureBuilder(
              // Future funkcija koja je zadužena za povlačenje proizvoda iz baze:
              future: Firestore.instance.collection('products').getDocuments(),
              builder: (BuildContext context, AsyncSnapshot snapshott) {
                if (snapshott.hasData) {
                  //popunjavanje liste products
                  products = snapshott.data.documents;
                  /*Korištenjem forEach metode popunjavamo selectedProducts listu, ,na način da userov unos
                  u search (query) , poredimo sa 'productName' koji je neki user unio pri kreiranju artikla */
                  products.forEach((element) {
                    if (element['productName'].toLowerCase().startsWith(query
                        .toLowerCase())) //Iva Elvir, omogucuje se ispis artikla bez
                      ///obzira da li je user unio veliko ili malo slovo u search
                      selectedProducts.add(element);
                  });
                  selectedProducts.forEach((element) {
                    print(element['productName']);
                  });
                  //Handlovanje slučaja da u bazi nema niti jednog artikla koji je user tražio:
                  if (selectedProducts == null || selectedProducts.isEmpty) {
                    return Center(
                      child: Text('U bazi trenutno nemamo traženi proizvod'),
                    );
                  } else {
                    /*Ako u bazi postoje proizvodi koji se poklapaju sa query-om koji je user ukucao u search,
                    korištenjem ListView buildera, prikazujemo artikle na ekran (ovaj ListView builder je reusable,
                    isti je korišten u itemCard.dart) */
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
                  //prikazivanje spinnera, u slučaju da učitavanje potraje malo duže
                  return CategoryLoading();
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container();
  }
}
