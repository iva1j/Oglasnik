import 'package:Oglasnik/model/productCategory.dart';
import 'package:Oglasnik/model/productCity.dart';
import 'package:Oglasnik/utils/suggestionFunction.dart';
import 'package:Oglasnik/utils/transitionFade.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/ProductsCards/CategoryCardContainer/categoryCardContainer.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/ProductsCards/categoryLoading.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/ProductsCards/itemCardDetails/itemCardTags.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/ProductsCards/productDetails.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/spinner.dart';
import 'package:Oglasnik/viewModel/PreviewProduct/previewCategory.dart';
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

class _ItemCardBodyState extends State<ItemCardBody> {
  @override
  Widget build(BuildContext context) {
    List<DocumentSnapshot> cities = List<DocumentSnapshot>();

    dynamicChips() {
      return Wrap(
        spacing: 5.0,
        children: List<Widget>.generate(citysuggestions.length, (int index) {
          return Container(
            margin: EdgeInsets.only(left: 10),
            child: Row(
              children: <Widget>[
                ActionChip(
                  label: Text(citysuggestions[index]),
                  onPressed: () {},
                ),
              ],
            ),
          );
        }),
      );
    }

    List<DocumentSnapshot> productItems = List<DocumentSnapshot>();
    return Column(
      children: <Widget>[
        Text('Ovdje trebaju ići chipovi'),
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
                                          itemCardProductName(context,
                                              snapshot.data.documents[index]),
                                          Container(
                                            width: 170,
                                            margin: EdgeInsets.only(
                                              right:
                                                  SizeConfig.blockSizeVertical *
                                                      2,
                                            ),
                                            child: itemCardDescription(
                                                snapshot.data.documents[index]),
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
                                  thickness: SizeConfig.blockSizeVertical * 0.2,
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

rowChips() {
  return Row(
    children: <Widget>[
      chipForRow('Health', Color(0xFFff8a65)),
      chipForRow('Food', Color(0xFF4fc3f7)),
      chipForRow('Lifestyle', Color(0xFF9575cd)),
      chipForRow('Sports', Color(0xFF4db6ac)),
      chipForRow('Nature', Color(0xFF5cda65)),
    ],
  );
}

Widget chipForRow(String label, Color color) {
  return Container(
    margin: EdgeInsets.all(6.0),
    child: Chip(
      labelPadding: EdgeInsets.all(5.0),
      avatar: CircleAvatar(
        backgroundColor: Colors.grey.shade600,
        child: Text(label[0].toUpperCase()),
      ),
      label: Text(
        label,
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      backgroundColor: color,
      elevation: 6.0,
      shadowColor: Colors.grey[60],
      padding: EdgeInsets.all(6.0),
    ),
  );
}
