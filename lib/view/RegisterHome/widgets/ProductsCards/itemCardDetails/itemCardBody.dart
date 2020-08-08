import 'package:Oglasnik/utils/strings.dart';
import 'package:Oglasnik/utils/suggestionFunction.dart';
import 'package:Oglasnik/utils/transitionFade.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/ProductsCards/itemCardDetails/ViewChips/actionChips.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/ProductsCards/itemCardDetails/ViewChips/dynamicChips.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/ProductsCards/itemCardDetails/itemCardTags.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/ProductsCards/productDetails.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/spinnerCircular.dart';
import 'package:flutter/material.dart';
import 'package:Oglasnik/utils/sizeconfig.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/ProductsCards/itemCard.dart';
import 'itemCardDescription.dart';
import 'itemCardImage.dart';
import 'itemCardPrice.dart';
import 'itemCardProductName.dart';

class ItemCardBody extends StatefulWidget {
  const ItemCardBody({
    Key key,
    @required this.widget,
  }) : super(key: key);

  final ItemCard widget;

  @override
  _ItemCardBodyState createState() => _ItemCardBodyState();
}

bool locationIsSelected(String location, List<String> selected) {
  if (selected.length == 0) return true;
  for (var i = 0; i < selected.length; i++) {
    if (location == selected[i]) return true;
  }
  return false;
}

class _ItemCardBodyState extends State<ItemCardBody> {
  refresh() {
    setState(() {});
  }

  //List<String> selectedChips = List<String>();

  ///Task rade: Faruk i Fahrudin
  ///
  ///Kreiranje filter chipova te ispisivanje gradova u njima
  ///
  ///Na pocetku ce biti dvije liste gradova cija cemo imena ispisivati u chipove (lista svih gradova - dynamicChips i
  ///lista odabranih - actionChips).
  ///Nakon sto sortiramo gradove abecedno, generisemo Widgete (Chip-ove) na osnovu stringova u listama. Prosljedjujemo
  ///tekst u sam Chip na osnovu liste i indexa. Stvari su analogne za dynamicChip-ove s tim da je razlika u tipovima
  ///chipova (Chip widget omogucava onDeleted property pa se automatski generise x button u samom chipu i on se koristi
  ///u actionChips, a ActionChips u dynamicChips (mozda smo malo neprecizno nazvali varijable, ali to nije toliko bitno))

  @override
  Widget build(BuildContext context) {
    bool showMessage = true;
    SizeConfig().init(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
            margin: EdgeInsets.only(
                left: SizeConfig.blockSizeHorizontal * 7,
                top: SizeConfig.blockSizeVertical * 2),
            child: Text(
              'Filter',
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
          child: FutureBuilder(
              future: Firestore.instance
                  .collection('products')
                  .where('productBrand',
                      isEqualTo: widget.widget.brandNameScreen)
                  .getDocuments(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Container(
                    child: Center(
                      child: SpinnerCircular(),
                    ),
                  );
                }

                return Container(
                  padding: EdgeInsets.only(bottom: 55),
                  child: ListView.builder(
                    itemCount: snapshot.data.documents.length,
                    itemBuilder: (_, int index) {
                      if (index == snapshot.data.documents.length - 1) {
                        if (locationIsSelected(
                            snapshot.data.documents[index]['productLocation'],
                            selectedChips)) {
                          showMessage = false;

                          return Material(
                            color: Colors.transparent,
                            child: InkWell(
                              splashColor: Colors.transparent,
                              onTap: () {
                                Navigator.of(context).push(
                                  FadeRoute(
                                    page: ProductDetails(
                                      productNameScreen: snapshot
                                          .data.documents[index]['productName'],
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
                                              itemCardProductName(
                                                  context,
                                                  snapshot
                                                      .data.documents[index]),
                                              Container(
                                                width: SizeConfig
                                                        .blockSizeHorizontal *
                                                    53,
                                                margin: EdgeInsets.only(
                                                  right: SizeConfig
                                                          .blockSizeVertical *
                                                      2,
                                                ),

                                                ///Fahrudin
                                                ///
                                                ///gledamo da li je duzina opisa nekog artikla manja od 150, u slucaju da
                                                ///jeste onda ga jednostavno ispisujemo u item card-u. Ako nije onda gledamo da li u
                                                ///podstringu (0,150) postoji tacka. Ukoliko postoji
                                                ///uzimamo onoliko karaktera na kojoj je poziciji zadnja tacka u
                                                ///podstringu od 150 karaktera kompletnog opisa, uklanjamo whitespace-ove
                                                ///i dodajemo mu ... na kraj. Ukoliko nema tacke u prvih 150 karaktera opisa, onda
                                                ///ispisemo prvih 150 karaktera i dodamo ...
                                                child: snapshot
                                                            .data
                                                            .documents[index]
                                                                ['productDesc']
                                                            .toString()
                                                            .trim()
                                                            .length <
                                                        150
                                                    ? itemCardDescription(
                                                        snapshot.data
                                                                .documents[index]
                                                            ['productDesc'])
                                                    : snapshot
                                                            .data
                                                            .documents[index]
                                                                ['productDesc']
                                                            .toString()
                                                            .trim()
                                                            .substring(0, 150)
                                                            .contains('.')
                                                        ? itemCardDescription(snapshot
                                                                .data
                                                                .documents[index]
                                                                    ['productDesc']
                                                                .toString()
                                                                .substring(0, snapshot.data.documents[index]['productDesc'].toString().substring(0, 150).lastIndexOf('.'))
                                                                .trim() +
                                                            "...")
                                                        : itemCardDescription(
                                                            snapshot
                                                                    .data
                                                                    .documents[
                                                                        index][
                                                                        'productDesc']
                                                                    .toString()
                                                                    .substring(
                                                                        0,
                                                                        150) +
                                                                '...',
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
                                              itemCardImage(snapshot
                                                  .data.documents[index]),
                                              itemCardPrice(snapshot
                                                  .data.documents[index]),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    Divider(
                                      thickness:
                                          SizeConfig.blockSizeVertical * 0.2,
                                    ),
                                    itemCardTags(
                                        snapshot.data.documents[index]),
                                  ],
                                ),
                              ),
                            ),
                          );
                        } else if (showMessage == true) {
                          return Container(
                              height: SizeConfig.blockSizeVertical * 60,
                              child: Center(
                                  child: Text(EmptyProductList().emptyList)));
                        } else {
                          return Container();
                        }
                      } else {
                        if (locationIsSelected(
                            snapshot.data.documents[index]['productLocation'],
                            selectedChips)) {
                          showMessage = false;

                          return Material(
                            color: Colors.transparent,
                            child: InkWell(
                              splashColor: Colors.transparent,
                              onTap: () {
                                Navigator.of(context).push(
                                  FadeRoute(
                                    page: ProductDetails(
                                      productNameScreen: snapshot
                                          .data.documents[index]['productName'],
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
                                              itemCardProductName(
                                                  context,
                                                  snapshot
                                                      .data.documents[index]),
                                              Container(
                                                width: SizeConfig
                                                        .blockSizeHorizontal *
                                                    53,
                                                margin: EdgeInsets.only(
                                                  right: SizeConfig
                                                          .blockSizeVertical *
                                                      2,
                                                ),

                                                ///Fahrudin
                                                ///
                                                ///gledamo da li je duzina opisa nekog artikla manja od 150, u slucaju da
                                                ///jeste onda ga jednostavno ispisujemo u item card-u. Ako nije onda gledamo da li u
                                                ///podstringu (0,150) postoji tacka. Ukoliko postoji
                                                ///uzimamo onoliko karaktera na kojoj je poziciji zadnja tacka u
                                                ///podstringu od 150 karaktera kompletnog opisa, uklanjamo whitespace-ove
                                                ///i dodajemo mu ... na kraj. Ukoliko nema tacke u prvih 150 karaktera opisa, onda
                                                ///ispisemo prvih 150 karaktera i dodamo ...
                                                child: snapshot
                                                            .data
                                                            .documents[index]
                                                                ['productDesc']
                                                            .toString()
                                                            .trim()
                                                            .length <
                                                        150
                                                    ? itemCardDescription(
                                                        snapshot.data
                                                                .documents[index]
                                                            ['productDesc'])
                                                    : snapshot
                                                            .data
                                                            .documents[index]
                                                                ['productDesc']
                                                            .toString()
                                                            .trim()
                                                            .substring(0, 150)
                                                            .contains('.')
                                                        ? itemCardDescription(snapshot
                                                                .data
                                                                .documents[index]
                                                                    ['productDesc']
                                                                .toString()
                                                                .substring(0, snapshot.data.documents[index]['productDesc'].toString().substring(0, 150).lastIndexOf('.'))
                                                                .trim() +
                                                            "...")
                                                        : itemCardDescription(
                                                            snapshot
                                                                    .data
                                                                    .documents[
                                                                        index][
                                                                        'productDesc']
                                                                    .toString()
                                                                    .substring(
                                                                        0,
                                                                        150) +
                                                                '...',
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
                                              itemCardImage(snapshot
                                                  .data.documents[index]),
                                              itemCardPrice(snapshot
                                                  .data.documents[index]),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    Divider(
                                      thickness:
                                          SizeConfig.blockSizeVertical * 0.2,
                                    ),
                                    itemCardTags(
                                        snapshot.data.documents[index]),
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
              }),
        ),
      ],
    );
  }
}
