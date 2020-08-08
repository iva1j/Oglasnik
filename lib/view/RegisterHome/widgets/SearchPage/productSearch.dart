import 'package:Oglasnik/utils/shared/ItemContainer/itemContainerDecoration.dart';
import 'package:Oglasnik/utils/shared/ItemContainer/itemContainerMargins.dart';
import 'package:Oglasnik/utils/strings.dart';
import 'package:Oglasnik/utils/suggestionFunction.dart';
import 'package:Oglasnik/view/RegisterHome/pages/searchPage.dart';
import 'package:Oglasnik/utils/shared/globalVariables.dart';
import 'package:Oglasnik/utils/sizeconfig.dart';
import 'package:Oglasnik/utils/strings.dart';
import 'package:Oglasnik/utils/suggestionFunction.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/ProductsCards/categoryLoading.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/ProductsCards/itemCardDetails/ViewChips/actionChips.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/ProductsCards/itemCardDetails/ViewChips/dynamicChips.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/ProductsCards/itemCardDetails/itemCardBody.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/ProductsCards/itemCardDetails/itemCardDescription.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/ProductsCards/itemCardDetails/itemCardImage.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/ProductsCards/itemCardDetails/itemCardPrice.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/ProductsCards/itemCardDetails/itemCardProductName.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/ProductsCards/itemCardDetails/itemCardTags.dart';
import 'package:Oglasnik/viewModel/PreviewProduct/Search/getProductsByBrand.dart';
import 'package:Oglasnik/viewModel/PreviewProduct/Search/productSearchViewModel.dart';
import 'package:Oglasnik/viewModel/PreviewProduct/getAllBrands.dart';
import 'package:flutter/material.dart';
import 'package:Oglasnik/utils/transitionFade.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/ProductsCards/productDetails.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SearchPageFutureBuilder extends StatefulWidget {
  SearchPageFutureBuilder({
    Key key,
    @required this.query,
  }) : super(key: key);
  @override
  final String query;
  _SearchPageFutureBuilderState createState() =>
      _SearchPageFutureBuilderState();
}

class _SearchPageFutureBuilderState extends State<SearchPageFutureBuilder> {
  refresh() {
    setState(() {});
  }

  List<DocumentSnapshot> selectedProducts = List<DocumentSnapshot>();
  @override
  Widget build(BuildContext context) {
    bool showMessage = true;
    List<DocumentSnapshot> products = List<DocumentSnapshot>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
            margin: EdgeInsets.only(
                left: SizeConfig.blockSizeHorizontal * 7,
                top: SizeConfig.blockSizeVertical * 2),
            child: Text(
              FilterTitle().filterNaslov,
              style: TextStyle(fontSize: 16.0),
            )),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: ActionChipsWidget(refresh),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DynamicChipsWidget(refresh),
        ),
        Expanded(
          child: allBrands.contains(widget.query.toLowerCase())
              ? FutureBuilder(
                  /// Future funkcija koja je zadužena za povlačenje proizvoda iz baze:
                  future: getProductsPerBrand(widget.query.toLowerCase()),

                  builder: (BuildContext context, AsyncSnapshot snapshott) {
                    if (snapshott.hasData) {
                      showingSelectedProducts(products, snapshott, true);

                      ///Handlovanje slučaja da u bazi nema niti jednog artikla koji je user tražio:
                      return selectedProducts == null ||
                              selectedProducts.isEmpty
                          ? Center(
                              child: Text(TrazeniProizvod().trazeniProizvod),
                            )
                          : Container(
                              padding: EdgeInsets.only(bottom: 55),
                              child: ListView.builder(
                                itemCount: selectedProducts.length,
                                itemBuilder: (_, int index) {
                                  if (index == selectedProducts.length - 1) {
                                    if (locationIsSelected(
                                        selectedProducts[index]
                                            ['productLocation'],
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
                                            decoration:
                                                itemContainerDecoration(),
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
                                                            MainAxisAlignment
                                                                .start,
                                                        children: <Widget>[
                                                          itemCardProductName(
                                                              context,
                                                              selectedProducts[
                                                                  index]),
                                                          Container(
                                                            width: SizeConfig
                                                                    .blockSizeHorizontal *
                                                                53,
                                                            margin:
                                                                EdgeInsets.only(
                                                              right: SizeConfig
                                                                      .blockSizeVertical *
                                                                  2,
                                                            ),

                                                            ///gledamo da li je duzina opisa nekog artikla manja od 150, u slucaju da
                                                            ///jeste onda ga jednostavno ispisujemo u item card-u. Ako nije onda
                                                            ///uzimamo njegovih prvih 150 character-a, uklanjamo whitespace-ove
                                                            ///i dodajemo mu ... na kraj.
                                                            child: selectedProducts[index]['productDesc']
                                                                        .toString()
                                                                        .trim()
                                                                        .length <
                                                                    150
                                                                ? itemCardDescription(
                                                                    selectedProducts[index]
                                                                        [
                                                                        'productDesc'])
                                                                : selectedProducts[index]['productDesc']
                                                                        .toString()
                                                                        .trim()
                                                                        .substring(
                                                                            0,
                                                                            150)
                                                                        .contains(
                                                                            '.')
                                                                    ? itemCardDescription(selectedProducts[index]['productDesc']
                                                                            .toString()
                                                                            .substring(0, selectedProducts[index]['productDesc'].toString().substring(0, 150).lastIndexOf('.'))
                                                                            .trim() +
                                                                        "...")
                                                                    : itemCardDescription(selectedProducts[index]['productDesc'].toString().substring(0, 150) + '...'),
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
                                                              selectedProducts[
                                                                  index]),
                                                          itemCardPrice(
                                                              selectedProducts[
                                                                  index]),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Divider(
                                                  thickness: SizeConfig
                                                          .blockSizeVertical *
                                                      0.2,
                                                ),
                                                itemCardTags(
                                                    selectedProducts[index]),
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    } else if (showMessage == true) {
                                      return Container(
                                          margin: EdgeInsets.symmetric(
                                              vertical:
                                                  SizeConfig.blockSizeVertical *
                                                      30),
                                          child: Center(
                                              child: Text(EmptyProductList()
                                                  .emptyList)));
                                    } else {
                                      return Container();
                                    }
                                  } else {
                                    if (locationIsSelected(
                                        selectedProducts[index]
                                            ['productLocation'],
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
                                            decoration:
                                                itemContainerDecoration(),
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
                                                            MainAxisAlignment
                                                                .start,
                                                        children: <Widget>[
                                                          itemCardProductName(
                                                              context,
                                                              selectedProducts[
                                                                  index]),
                                                          Container(
                                                            width: SizeConfig
                                                                    .blockSizeHorizontal *
                                                                53,
                                                            margin:
                                                                EdgeInsets.only(
                                                              right: SizeConfig
                                                                      .blockSizeVertical *
                                                                  2,
                                                            ),
                                                            child: selectedProducts[index]['productDesc']
                                                                        .toString()
                                                                        .trim()
                                                                        .length <
                                                                    150
                                                                ? itemCardDescription(
                                                                    selectedProducts[index]
                                                                        [
                                                                        'productDesc'])
                                                                : selectedProducts[index]['productDesc']
                                                                        .toString()
                                                                        .trim()
                                                                        .substring(
                                                                            0,
                                                                            150)
                                                                        .contains(
                                                                            '.')
                                                                    ? itemCardDescription(selectedProducts[index]['productDesc']
                                                                            .toString()
                                                                            .substring(0, selectedProducts[index]['productDesc'].toString().substring(0, 150).lastIndexOf('.'))
                                                                            .trim() +
                                                                        "...")
                                                                    : itemCardDescription(selectedProducts[index]['productDesc'].toString().substring(0, 150) + '...'),
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
                                                              selectedProducts[
                                                                  index]),
                                                          itemCardPrice(
                                                              selectedProducts[
                                                                  index]),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Divider(
                                                  thickness: SizeConfig
                                                          .blockSizeVertical *
                                                      0.2,
                                                ),
                                                itemCardTags(
                                                    selectedProducts[index]),
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
                    } else {
                      //prikazivanje spinnera, u slučaju da učitavanje potraje malo duže
                      return CategoryLoading();
                    }
                  },
                )
              : FutureBuilder(
                  /// Future funkcija koja je zadužena za povlačenje proizvoda iz baze:
                  future:
                      Firestore.instance.collection('products').getDocuments(),

                  builder: (BuildContext context, AsyncSnapshot snapshott) {
                    if (snapshott.hasData) {
                      showingSelectedProducts(products, snapshott, false);

                      ///Handlovanje slučaja da u bazi nema niti jednog artikla koji je user tražio:
                      return selectedProducts == null ||
                              selectedProducts.isEmpty
                          ? Center(
                              child: Text(TrazeniProizvod().trazeniProizvod),
                            )
                          : Container(
                              padding: EdgeInsets.only(bottom: 55),
                              child: ListView.builder(
                                itemCount: selectedProducts.length,
                                itemBuilder: (_, int index) {
                                  if (index == selectedProducts.length - 1) {
                                    if (locationIsSelected(
                                        selectedProducts[index]
                                            ['productLocation'],
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
                                            decoration:
                                                itemContainerDecoration(),
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
                                                            MainAxisAlignment
                                                                .start,
                                                        children: <Widget>[
                                                          itemCardProductName(
                                                              context,
                                                              selectedProducts[
                                                                  index]),
                                                          Container(
                                                            width: SizeConfig
                                                                    .blockSizeHorizontal *
                                                                53,
                                                            margin:
                                                                EdgeInsets.only(
                                                              right: SizeConfig
                                                                      .blockSizeVertical *
                                                                  2,
                                                            ),

                                                            ///gledamo da li je duzina opisa nekog artikla manja od 150, u slucaju da
                                                            ///jeste onda ga jednostavno ispisujemo u item card-u. Ako nije onda
                                                            ///uzimamo njegovih prvih 150 character-a, uklanjamo whitespace-ove
                                                            ///i dodajemo mu ... na kraj.
                                                            child: selectedProducts[index]['productDesc']
                                                                        .toString()
                                                                        .trim()
                                                                        .length <
                                                                    150
                                                                ? itemCardDescription(
                                                                    selectedProducts[index]
                                                                        [
                                                                        'productDesc'])
                                                                : selectedProducts[index]['productDesc']
                                                                        .toString()
                                                                        .trim()
                                                                        .substring(
                                                                            0,
                                                                            150)
                                                                        .contains(
                                                                            '.')
                                                                    ? itemCardDescription(selectedProducts[index]['productDesc']
                                                                            .toString()
                                                                            .substring(0, selectedProducts[index]['productDesc'].toString().substring(0, 150).lastIndexOf('.'))
                                                                            .trim() +
                                                                        "...")
                                                                    : itemCardDescription(selectedProducts[index]['productDesc'].toString().substring(0, 150) + '...'),
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
                                                              selectedProducts[
                                                                  index]),
                                                          itemCardPrice(
                                                              selectedProducts[
                                                                  index]),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Divider(
                                                  thickness: SizeConfig
                                                          .blockSizeVertical *
                                                      0.2,
                                                ),
                                                itemCardTags(
                                                    selectedProducts[index]),
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    } else if (showMessage == true) {
                                      return Container(
                                          margin: EdgeInsets.symmetric(
                                              vertical:
                                                  SizeConfig.blockSizeVertical *
                                                      30),
                                          child: Center(
                                              child: Text(EmptyProductList()
                                                  .emptyList)));
                                    } else {
                                      return Container();
                                    }
                                  } else {
                                    if (locationIsSelected(
                                        selectedProducts[index]
                                            ['productLocation'],
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
                                            decoration:
                                                itemContainerDecoration(),
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
                                                            MainAxisAlignment
                                                                .start,
                                                        children: <Widget>[
                                                          itemCardProductName(
                                                              context,
                                                              selectedProducts[
                                                                  index]),
                                                          Container(
                                                            width: SizeConfig
                                                                    .blockSizeHorizontal *
                                                                53,
                                                            margin:
                                                                EdgeInsets.only(
                                                              right: SizeConfig
                                                                      .blockSizeVertical *
                                                                  2,
                                                            ),
                                                            child: selectedProducts[index]['productDesc']
                                                                        .toString()
                                                                        .trim()
                                                                        .length <
                                                                    150
                                                                ? itemCardDescription(
                                                                    selectedProducts[index]
                                                                        [
                                                                        'productDesc'])
                                                                : selectedProducts[index]['productDesc']
                                                                        .toString()
                                                                        .trim()
                                                                        .substring(
                                                                            0,
                                                                            150)
                                                                        .contains(
                                                                            '.')
                                                                    ? itemCardDescription(selectedProducts[index]['productDesc']
                                                                            .toString()
                                                                            .substring(0, selectedProducts[index]['productDesc'].toString().substring(0, 150).lastIndexOf('.'))
                                                                            .trim() +
                                                                        "...")
                                                                    : itemCardDescription(selectedProducts[index]['productDesc'].toString().substring(0, 150) + '...'),
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
                                                              selectedProducts[
                                                                  index]),
                                                          itemCardPrice(
                                                              selectedProducts[
                                                                  index]),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Divider(
                                                  thickness: SizeConfig
                                                          .blockSizeVertical *
                                                      0.2,
                                                ),
                                                itemCardTags(
                                                    selectedProducts[index]),
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
                    } else {
                      //prikazivanje spinnera, u slučaju da učitavanje potraje malo duže
                      return CategoryLoading();
                    }
                  },
                ),
        ),
      ],
    );
  }

  void showingSelectedProducts(List<DocumentSnapshot> products,
      AsyncSnapshot snapshott, bool brandEntered) async {
    products.clear();
    brandEntered
        ? products = snapshott.data
        : products = snapshott.data.documents;
    selectedProducts.clear();
    /*Korištenjem forEach metode popunjavamo selectedProducts listu, ,na način da userov unos
    u search (query) , poredimo sa 'productName' koji je neki user unio pri kreiranju artikla */

    ///Fahrudin
    ///
    ///OG-205 (search query (hint: puma))
    ///
    ///Nakon sto povucemo sve brandove iz svake kategorije (pomocu jednostavne funkcije iz getAllBrands.dart fajla koja
    ///vraca nazive svih brandova malim slovima) gledamo da li query pretvoren u mala slova pripada nekom od njih i ako
    ///pripada povlacimo sve produkte iz baze sa tim nazivom brenda i smjestamo u odabrane proizvode. Ovo je ovako moralo
    ///biti uradjeno posto korisnik moze unijeti npr. i puma/Puma/PUMA itd. i u svakom slucaju bi trebalo da ispise
    ///proizvode brand-a puma.

    if (brandEntered) {
      selectedProducts.addAll(products);
      products.forEach((element) {
        if (((element['productName']
                        .toLowerCase()
                        .contains(widget.query.toLowerCase() + ' ') &&
                    element['productName']
                        .toLowerCase()
                        .toString()
                        .startsWith(widget.query.toLowerCase())) ||
                (element['productName']
                        .toLowerCase()
                        .contains(' ' + widget.query.toLowerCase()) &&
                    element['productName']
                        .toLowerCase()
                        .toString()
                        .endsWith(widget.query.toLowerCase())) ||
                element['productName']
                    .toLowerCase()
                    .contains(' ' + widget.query.toLowerCase() + ' ') ||
                element['productName'] == widget.query) &&
            !selectedProducts
                .contains(element)) //Iva Elvir, omogucuje se ispis artikla bez
          ///obzira da li je user unio veliko ili malo slovo u search
          selectedProducts.add(element);
      });
    } else {
      products.forEach((element) {
        if ((element['productName']
                    .toLowerCase()
                    .contains(widget.query.toLowerCase() + ' ') &&
                element['productName']
                    .toLowerCase()
                    .toString()
                    .startsWith(widget.query.toLowerCase())) ||
            (element['productName']
                    .toLowerCase()
                    .contains(' ' + widget.query.toLowerCase()) &&
                element['productName']
                    .toLowerCase()
                    .toString()
                    .endsWith(widget.query.toLowerCase())) ||
            element['productName']
                .toLowerCase()
                .contains(' ' + widget.query.toLowerCase() + ' ') ||
            element['productName'] == widget.query)
          selectedProducts.add(element);
      });
    }
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
