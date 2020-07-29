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

class ItemCardBody extends StatelessWidget {
  const ItemCardBody({
    Key key,
    @required this.widget,
  }) : super(key: key);

  final ItemCard widget;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: StreamBuilder(
              stream: Firestore.instance
                  .collection('products')
                  .where('productBrand', isEqualTo: widget.brandNameScreen)
                  .snapshots(),
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: <Widget>[
                                          itemCardProductName(
                                              context, snapshot, index),
                                          itemCardDescription(snapshot, index),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        children: <Widget>[
                                          itemCardImage(snapshot, index),
                                          itemCardPrice(snapshot, index),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Divider(
                                  thickness: SizeConfig.blockSizeVertical * 0.2,
                                ),
                                itemCardTags(snapshot, index),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                );
              }),
        ),
      ],
    );
  }
}
// SingleChildScrollView itemCardTags(AsyncSnapshot snapshot, int index) {
//   return SingleChildScrollView(
//     scrollDirection: Axis.horizontal,
//     child: Row(
//       mainAxisAlignment: MainAxisAlignment.start,
//       children: snapshot.data.documents[index]['productTag']
//           .split(',')
//           //.removeWhere((item) => item.length == 0)
//           //.remove("")
//           .map<Widget>(
//             (element) => element.trim().length > 0
//                 ? new OglasTag(naziv: element)
//                 : Container(),
//           )
//           .toList(),
//     ),
//   );
// }

//   ItemPrice itemCardPrice(AsyncSnapshot snapshot, int index) {
//     return ItemPrice(price: snapshot.data.documents[index]['cijena']);
//   }

//   ItemImage itemCardImage(AsyncSnapshot snapshot, int index) {
//     return ItemImage(
//         img: (snapshot.data.documents[index]['productImg1'] != null)
//             ? snapshot.data.documents[index]['productImg1']
//             : (snapshot.data.documents[index]['productImg2'] != null)
//                 ? snapshot.data.documents[index]['productImg2']
//                 : (snapshot.data.documents[index]['productImg3'] != null)
//                     ? snapshot.data.documents[index]['productImg3']
//                     : "");
//   }

//   ItemDescription itemCardDescription(AsyncSnapshot snapshot, int index) {
//     return ItemDescription(
//       description: snapshot.data.documents[index]['productDesc'],
//     );
//   }

//   InkWell itemCardProductName(
//       BuildContext context, AsyncSnapshot snapshot, int index) {
//     return InkWell(
//       onTap: () {
//         Navigator.of(context).push(MaterialPageRoute(
//             builder: (_) => ProductDetails(
//                   productNameScreen: snapshot.data.documents[index]
//                       ['productName'],
//                 )));
//       },
//       child: ItemName(
//         name: snapshot.data.documents[index]['productName'],
//       ),
//     );
//   }
// }
