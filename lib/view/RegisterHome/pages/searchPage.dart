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
  final cars = [
    "Audi",
    "Audi",
    "Mercedes",
    "Volvo",
    "Range rover",
    "Toyota",
    "Subaru",
    "BMW",
    "Ford"
  ];

  final recentCars = [
    "Audi",
    "Mercedes",
    "Volvo",
  ];
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
                  if (!snapshott.hasData) {
                    return Center(
                      child: Text('U bazi trenutno nemamo tog proizvoda'),
                    );
                  }
                  products = snapshott.data.documents;
                  // if (products.length == 0){
                  //   }
                  products.forEach((element) {
                    if (element['productName'].startsWith(query))
                      selectedProducts.add(element);
                    //  print(element['productName']);
                  });
                  selectedProducts.forEach((element) {
                    print(element['productName']);
                  });
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
                                    mainAxisAlignment: MainAxisAlignment.start,
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
                } else {
                 return CategoryLoading();
                }
              }),
        )
      ]),
    );

    // StreamBuilder(
    //     stream: Firestore.instance.collection('products').snapshots(),
    //     builder: (context, snapshot) {
    //       if (!snapshot.hasData) {
    //         return Container(
    //           child: Card(
    //             elevation: 8,
    //             color: Colors.white,
    //             child: Text('No Items'),
    //           ),
    //         );
    //       }

    // return Container(
    //   padding: EdgeInsets.only(bottom: 55),
    //   child: ListView.builder(
    //     itemCount: snapshot.data.documents.length,
    //     itemBuilder: (_, int index) {
    //       return Material(
    //         color: Colors.transparent,
    //         child: InkWell(
    //           splashColor: Colors.transparent,
    //           onTap: () {
    //             Navigator.of(context).push(
    //               FadeRoute(
    //                 page: ProductDetails(
    //                   productNameScreen: products[index]
    //                       ['productName'],
    //                   // snapshot
    //                   //     .data.documents[index]['productName'],
    //                 ),
    //               ),
    //             );
    //           },
    //           child: Container(
    //             decoration: BoxDecoration(
    //               color: Colors.white,
    //               boxShadow: [
    //                 BoxShadow(
    //                   color: Colors.grey.withOpacity(0.2),
    //                   spreadRadius: 1,
    //                   blurRadius: 7,
    //                   offset: Offset(0, 3),
    //                 ),
    //               ],
    //               border: Border.all(
    //                 color: Colors.black26,
    //               ),
    //               borderRadius: BorderRadius.all(
    //                 Radius.circular(4),
    //               ),
    //             ),
    //             margin: EdgeInsets.only(
    //               left: SizeConfig.blockSizeHorizontal * 5,
    //               right: SizeConfig.blockSizeHorizontal * 5,
    //               top: SizeConfig.blockSizeVertical * 4,
    //               bottom: SizeConfig.blockSizeVertical * 2,
    //             ),
    //             child: Column(
    //               mainAxisSize: MainAxisSize.min,
    //               crossAxisAlignment: CrossAxisAlignment.start,
    //               children: <Widget>[
    //                 Row(
    //                   crossAxisAlignment:
    //                       CrossAxisAlignment.start,
    //                   mainAxisAlignment: MainAxisAlignment.start,
    //                   children: <Widget>[
    //                     Expanded(
    //                       child: Column(
    //                         mainAxisAlignment:
    //                             MainAxisAlignment.start,
    //                         children: <Widget>[
    //                           itemCardProductName(
    //                               context, snapshot, index),
    //                           Container(
    //                               width: 170,
    //                               margin: EdgeInsets.only(
    //                                 right: SizeConfig
    //                                         .blockSizeVertical *
    //                                     2,
    //                               ),
    //                               child: itemCardDescription(
    //                                   snapshot, index)),
    //                         ],
    //                       ),
    //                     ),
    //                     Expanded(
    //                       child: Column(
    //                         crossAxisAlignment:
    //                             CrossAxisAlignment.stretch,
    //                         children: <Widget>[
    //                           itemCardImage(snapshot, index),
    //                           itemCardPrice(snapshot, index),
    //                         ],
    //                       ),
    //                     ),
    //                   ],
    //                 ),
    //                 Divider(
    //                   thickness:
    //                       SizeConfig.blockSizeVertical * 0.2,
    //                 ),
    //                 itemCardTags(snapshot, index),
    //               ],
    //             ),
    //           ),
    //         ),
    //       );
    //     },
    //   ),
    // );

    //             }),
    //       ),
    //     ],
    //   ),
    // );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionsList = query.isEmpty
        ? recentCars
        : cars.where((e) => e.startsWith(query)).toList();

    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        onTap: () {
          showResults(context);
        },
        title: RichText(
          text: TextSpan(
              text: suggestionsList[index].substring(0, query.length),
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              children: [
                TextSpan(
                    text: suggestionsList[index].substring(query.length),
                    style: TextStyle(color: Colors.grey))
              ]),
        ),
      ),
      itemCount: suggestionsList.length,
    );
  }
}
