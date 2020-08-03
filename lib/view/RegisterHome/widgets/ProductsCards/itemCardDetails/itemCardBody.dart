import 'package:Oglasnik/utils/transitionFade.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/ProductsCards/itemCardDetails/itemCardTags.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/ProductsCards/productDetails.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/spinner.dart';
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
    List<DocumentSnapshot> productItems = List<DocumentSnapshot>();

    return Column(
      children: <Widget>[
        Expanded(
          child: FutureBuilder(
              future: Firestore.instance
                  .collection('products')
                  .where('productBrand', isEqualTo: widget.brandNameScreen)
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
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Expanded(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: <Widget>[
                                            itemCardProductName(context,
                                                snapshot.data.documents[index]),
                                            Container(
                                              width: 170,
                                              margin: EdgeInsets.only(
                                                right: SizeConfig
                                                        .blockSizeVertical *
                                                    2,
                                              ),
                                              child: itemCardDescription(
                                                  snapshot
                                                      .data.documents[index]),
                                            )
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
                                          children: <Widget>[
                                            itemCardImage(
                                                snapshot.data.documents[index]),
                                            itemCardPrice(
                                                snapshot.data.documents[index]),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Divider(
                                    thickness:
                                        SizeConfig.blockSizeVertical * 0.2,
                                  ),
                                  itemCardTags(snapshot.data.documents[index]),
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
