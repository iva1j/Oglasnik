import 'package:Oglasnik/utils/shared/globalVariables.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/ProductsCards/productDetails.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/itemCardWidgets/itemDescription.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/itemCardWidgets/itemImage.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/itemCardWidgets/itemName.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/itemCardWidgets/itemPrice.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/itemCardWidgets/oglasTag.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/mainFloatingButton.dart';
import 'package:flutter/material.dart';
import 'package:Oglasnik/utils/sizeconfig.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:Oglasnik/view/AnonymousHome/widgets/homeFloatingButton.dart';

class ItemCard extends StatefulWidget {
  //String audi = "assets/images/audi.jpg";
  final String brandNameScreen;
  ItemCard({Key key, @required this.brandNameScreen}) : super(key: key);

  @override
  _ItemCardState createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.close, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
          backgroundColor: AppBarTheme.of(context).color,
          centerTitle: true,
          title: Text(widget.brandNameScreen),
        ),
        floatingActionButton: email != null
            ? mainFloatingButton(email)
            : homeFloatingAnimatedButton(),
        bottomSheet: Container(
          height: 55,
          width: double.infinity,
          color: Color.fromARGB(255, 226, 11, 48),
        ),
        body: Column(
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
                          return InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (_) => ProductDetails(
                                        productNameScreen: snapshot.data
                                            .documents[index]['productName'],
                                      )));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.2),
                                    spreadRadius: 1,
                                    blurRadius: 7,

                                    offset: Offset(
                                        0, 3), // changes position of shadow
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
                                            InkWell(
                                              onTap: () {
                                                Navigator.of(context).push(
                                                    MaterialPageRoute(
                                                        builder:
                                                            (_) =>
                                                                ProductDetails(
                                                                  productNameScreen: snapshot
                                                                          .data
                                                                          .documents[index]
                                                                      [
                                                                      'productName'],
                                                                )));
                                              },
                                              child: ItemName(
                                                name: snapshot
                                                        .data.documents[index]
                                                    ['productName'],
                                              ),
                                            ),
                                            ItemDescription(
                                              description:
                                                  snapshot.data.documents[index]
                                                      ['productDesc'],
                                            ),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
                                          children: <Widget>[
                                            ItemImage(
                                                /*
                                                img: snapshot.data.documents[index]
                                                            ['productImg1'] !=
                                                        null
                                                    ? snapshot.data.documents[index]
                                                        ['productImg1']
                                                    : ""*/
                                                img: (snapshot.data.documents[index]
                                                            ['productImg1'] !=
                                                        null)
                                                    ? snapshot.data.documents[index]
                                                        ['productImg1']
                                                    : (snapshot.data.documents[index]
                                                                [
                                                                'productImg2'] !=
                                                            null)
                                                        ? snapshot.data.documents[index]
                                                            ['productImg2']
                                                        : (snapshot.data.documents[index]['productImg3'] != null)
                                                            ? snapshot.data
                                                                    .documents[index]
                                                                ['productImg3']
                                                            : ""),
                                            ItemPrice(
                                                price: snapshot
                                                        .data.documents[index]
                                                    ['cijena']),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Divider(
                                    thickness:
                                        SizeConfig.blockSizeVertical * 0.2,
                                  ),
                                  SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: snapshot
                                          .data.documents[index]['productTag']
                                          .split(',')
                                          //.removeWhere((item) => item.length == 0)
                                          //.remove("")
                                          .map<Widget>(
                                            (element) => element.trim().length >
                                                    0
                                                ? new OglasTag(naziv: element)
                                                : Container(),
                                          )
                                          .toList(),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  }),
            ),
            // SizedBox(
            //   height: SizeConfig.blockSizeVertical * 6,
            // )
          ],
        ));
  }
}
