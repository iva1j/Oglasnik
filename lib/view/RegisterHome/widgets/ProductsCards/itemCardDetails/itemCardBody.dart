import 'package:Oglasnik/model/productCategory.dart';
import 'package:Oglasnik/model/productCity.dart';
import 'package:Oglasnik/utils/colors_and_themes/colors.dart';
import 'package:Oglasnik/utils/strings.dart';
import 'package:Oglasnik/utils/suggestionFunction.dart';
import 'package:Oglasnik/utils/transitionFade.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/ProductsCards/itemCardDetails/itemCardTags.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/ProductsCards/productDetails.dart';
import 'package:flutter/material.dart';
import 'package:Oglasnik/utils/sizeconfig.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/ProductsCards/itemCard.dart';
import 'itemCardDescription.dart';
import 'itemCardImage.dart';
import 'itemCardPrice.dart';
import 'itemCardProductName.dart';
import 'package:flushbar/flushbar.dart';
import 'package:Oglasnik/utils/sizeconfig.dart';

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
  /*selected.forEach((element) {
    if (location == element) return true;
  });
  return false;*/
  for (var i = 0; i < selected.length; i++) {
    if (location == selected[i]) return true;
  }
  return false;
}

class _ItemCardBodyState extends State<ItemCardBody> {
  List<String> selectedChips = List<String>();

  ///Iva i Elvir , sortiranje čipova za odabrane čipove i čipove iz liste,
  ///pomoću sortiranja čipovi se nakon sto su obrisani vrate na svoje prvobitne pozicije u listi
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    actionChips() {
      selectedChips.sort();
      return Container(
        margin: EdgeInsets.only(left: SizeConfig.blockSizeHorizontal * 6),
        child: Row(
          children: List<Widget>.generate(selectedChips.length, (index) {
            return Container(
              margin: EdgeInsets.only(
                right: SizeConfig.blockSizeHorizontal * 2,
              ),
              child: Chip(
                label: Text(
                  selectedChips[index],
                  style: TextStyle(
                    color: Color.fromRGBO(0, 0, 0, 0.34),
                  ),
                ),
                backgroundColor: Color.fromRGBO(226, 11, 48, 0.1),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                  Radius.circular(14),
                )),
                deleteIconColor: Color.fromRGBO(0, 0, 0, 0.54),
                onDeleted: () {
                  setState(() {
                    citysuggestions.add(selectedChips[index]);
                    selectedChips.removeAt(index);
                  });
                },
              ),
            );
          }),
        ),
      );
    }

    ///Iva i Elvir , sortiranje čipova za odabrane čipove i čipove iz liste,
    ///pomoću sortiranja čipovi se nakon sto su obrisani vrate na svoje prvobitne pozicije u listi
    dynamicChips() {
      citysuggestions.sort();
      return Container(
        margin: EdgeInsets.only(left: SizeConfig.blockSizeHorizontal * 6),
        child: Row(
          children: List<Widget>.generate(citysuggestions.length, (int index) {
            return Container(
              margin: EdgeInsets.only(
                right: SizeConfig.blockSizeHorizontal * 2,
              ),
              child: ActionChip(
                label: Text(
                  citysuggestions[index],
                  style: TextStyle(
                    color: Color.fromRGBO(0, 0, 0, 0.54),
                  ),
                ),
                backgroundColor: Color.fromRGBO(153, 153, 153, 0.2),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(14),
                  ),
                ),

                /// Ovaj dio koda radili : Iva i Amer
                /// na onPressed , uzimamo element iz liste citysuggestions i dodajemo ga u listu selectedChips, na taj
                /// način pratimo koliko je user izabrao gradova.
                onPressed: () {
                  if (selectedChips.length < 3) {
                    setState(() {
                      selectedChips.add(citysuggestions[index]);
                      citysuggestions.removeAt(index);
                    });
                  } else {
                    Flushbar(
                      title: "Pogreška!",
                      //message: "Ne moze biti vise od 3 odabrana grada",

                      icon: Icon(
                        Icons.error,
                        size: 34,
                        color: Colors.white,
                      ),
                      backgroundColor: mainAppColor,
                      barBlur: 10,

                      duration: Duration(seconds: 5),
                      flushbarPosition: FlushbarPosition.BOTTOM,
                      boxShadows: [
                        BoxShadow(
                          color: Colors.black,
                          offset: Offset(0.0, 2.0),
                          blurRadius: 3.0,
                        )
                      ],
                      progressIndicatorBackgroundColor: Colors.blue,
                      shouldIconPulse: true,
                      messageText: Text(
                        FlushBarText().message,
                        style: TextStyle(fontSize: 16.0, color: Colors.white),
                      ),
                      flushbarStyle: FlushbarStyle.FLOATING,
                      borderRadius: 30.0,
                    )..show(context);
                  }
                },
              ),
            );
          }),
        ),
      );
    }

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
          child: actionChips(),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: dynamicChips(),
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
                    child: Card(
                      elevation: 8,
                      color: Colors.white,
                      child: Text('No Items'),
                    ),
                  );
                }

                return Container(
                  padding: EdgeInsets.only(bottom: 55),
                  child: ListView.builder(
                    itemCount: snapshot.data.documents.length,
                    itemBuilder: (_, int index) {
                      return locationIsSelected(
                              snapshot.data.documents[index]['productLocation'],
                              selectedChips)
                          ? Material(
                              color: Colors.transparent,
                              child: InkWell(
                                splashColor: Colors.transparent,
                                onTap: () {
                                  Navigator.of(context).push(
                                    FadeRoute(
                                      page: ProductDetails(
                                        productNameScreen: snapshot.data
                                            .documents[index]['productName'],
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
                                                itemCardProductName(
                                                    context,
                                                    snapshot
                                                        .data.documents[index]),
                                                Container(
                                                  width: 170,
                                                  margin: EdgeInsets.only(
                                                    right: SizeConfig
                                                            .blockSizeVertical *
                                                        2,
                                                  ),
                                                  child: itemCardDescription(
                                                      snapshot.data
                                                          .documents[index]),
                                                )
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
                            )
                          : Container();
                    },
                  ),
                );
              }),
        ),
      ],
    );
  }
}
