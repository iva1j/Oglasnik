import 'package:Oglasnik/utils/shared/globalVariables.dart';
import 'package:Oglasnik/view/AnonymousHome/widgets/bottomSheet.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/ProductsCards/categoryLoading.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/ProductsCards/itemCardDetails/itemCardDescription.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/ProductsCards/itemCardDetails/itemCardImage.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/ProductsCards/itemCardDetails/itemCardPrice.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/ProductsCards/itemCardDetails/itemCardProductName.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/ProductsCards/itemCardDetails/itemCardTags.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/mainFloatingButton.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/spinner.dart';
import 'package:flutter/material.dart';
import 'package:Oglasnik/utils/sizeconfig.dart';
import 'package:Oglasnik/view/AnonymousHome/widgets/homeFloatingButton.dart';
import 'package:Oglasnik/utils/transitionFade.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/ProductsCards/productDetails.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// class SearchPage extends StatefulWidget {
//   @override
//   _SearchPageState createState() => _SearchPageState();
// }

// class _SearchPageState extends State<SearchPage> {
//   List<dynamic> products = [];
//   // @override
//   // Widget build(BuildContext context) {
//   //   setState(() {
//   //     isLoading = false;
//   //     doesPop = true;
//   //   });
//   //   SizeConfig().init(context);
//   //   return Scaffold(
//   //     appBar: AppBar(
//   //       backgroundColor: AppBarTheme.of(context).color,
//   //       centerTitle: true,
//   //       title: Text('Oglasnik'),
//   //       leading: LogoutButton(),
//   //       actions: <Widget>[
//   //         IconButton(
//   //           icon: Icon(Icons.search),
//   //           onPressed: () {
//   //             showSearch(context: context, delegate: DataSearch());
//   //           },
//   //         )
//   //       ],
//   //     ),
//   //     floatingActionButton: email != null
//   //         ? mainFloatingButton(email)
//   //         : homeFloatingAnimatedButton(),
//   //     bottomSheet: BottomSheetContainer(),
//   //     body: Container(
//   //       child: Card(
//   //         child: Text(query),
//   //       ),
//   //     ),
//   //   );
//   // }
// }

class DataSearch extends SearchDelegate<String> {
  @override
  String get searchFieldLabel => "Pretraga proizvoda...";

  // final cars = [
  //   "Audi",
  //   "Audi",
  //   "Mercedes",
  //   "Volvo",
  //   "Range rover",
  //   "Toyota",
  //   "Subaru",
  //   "BMW",
  //   "Ford"
  // ];

  // final recentCars = [
  //   "Audi",
  //   "Mercedes",
  //   "Volvo",
  // ];
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
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
                      child: Text('U bazi trenutno nemamo tog proizvoda'),
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
