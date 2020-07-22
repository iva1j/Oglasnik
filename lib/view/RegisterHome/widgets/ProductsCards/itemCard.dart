import 'package:Oglasnik/utils/shared/globalVariables.dart';
import 'package:Oglasnik/utils/strings.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/ProductsCards/productDetails.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/mainFloatingButton.dart';
import 'package:flutter/material.dart';
import 'package:Oglasnik/utils/sizeconfig.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class ItemCard extends StatelessWidget {
  //String audi = "assets/images/audi.jpg";
  final String brandNameScreen;
  ItemCard({Key key, @required this.brandNameScreen}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppBarTheme.of(context).color,
          centerTitle: true,
          title: Text(brandNameScreen),
          leading: IconButton(
            icon: Icon(Icons.close, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        floatingActionButton: mainFloatingButton(email),
        bottomSheet: Container(
          height: 55,
          width: double.infinity,
          color: Color.fromARGB(255, 226, 11, 48),
        ),
        body: Column(
          children: <Widget>[
            SizedBox(
              height: SizeConfig.blockSizeVertical * 10,
            ),
            Expanded(
              child: StreamBuilder(
                  stream: Firestore.instance
                      .collection('products')
                      .where('productBrand', isEqualTo: brandNameScreen)
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
                    return ListView.builder(
                      itemCount: snapshot.data.documents.length,
                      itemBuilder: (_, int index) {
                        return Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                spreadRadius: 1,
                                blurRadius: 7,

                                offset:
                                    Offset(0, 3), // changes position of shadow
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
                            //top: SizeConfig.blockSizeVertical * 5,
                            bottom: SizeConfig.blockSizeVertical * 5,
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
                                        InkWell(
                                          onTap: () {
                                            Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: (_) =>
                                                        ProductDetails(
                                                          productNameScreen: snapshot
                                                                      .data
                                                                      .documents[
                                                                  index]
                                                              ['productName'],
                                                        )));
                                          },
                                          child: ItemName(
                                            name: snapshot.data.documents[index]
                                                ['productName'],
                                          ),
                                        ),
                                        ItemDescription(
                                          description: snapshot.data
                                              .documents[index]['productDesc'],
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
                                                            ['productImg2'] !=
                                                        null)
                                                    ? snapshot.data.documents[index]
                                                        ['productImg2']
                                                    : (snapshot.data.documents[index][
                                                                'productImg3'] !=
                                                            null)
                                                        ? snapshot.data.documents[index]
                                                            ['productImg3']
                                                        : ""),
                                        ItemPrice(
                                            price: snapshot.data
                                                .documents[index]['cijena']),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Divider(
                                thickness: SizeConfig.blockSizeVertical * 0.2,
                              ),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: snapshot
                                      .data.documents[index]['productTag']
                                      .split(',')
                                      .map<Widget>((element) =>
                                          new OglasTag(naziv: element))
                                      .toList(),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  }),
            ),
          ],
        ));
  }
}

class ItemName extends StatelessWidget {
  final String name;
  const ItemName({
    Key key,
    @required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: SizeConfig.blockSizeVertical * 2,
        bottom: SizeConfig.blockSizeVertical,
        left: SizeConfig.blockSizeHorizontal * 3,
      ),
      child: Align(
        alignment: Alignment.topLeft,
        child: Text(
          name,
          style: TextStyle(
            fontSize: SizeConfig.safeBlockHorizontal * 5,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}

class ItemDescription extends StatelessWidget {
  final String description;
  const ItemDescription({
    Key key,
    @required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: SizeConfig.blockSizeVertical * 2,
        bottom: SizeConfig.blockSizeVertical,
        left: SizeConfig.blockSizeHorizontal * 3,
      ),
      child: Text(
        description,
      ),
    );
  }
}

class ItemImage extends StatelessWidget {
  const ItemImage({
    Key key,
    @required this.img,
  }) : super(key: key);

  final String img;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: SizeConfig.blockSizeVertical * 1,
        right: SizeConfig.blockSizeHorizontal * 1,
      ),
      height: SizeConfig.blockSizeVertical * 20,
      width: SizeConfig.blockSizeVertical * 20,
      decoration: BoxDecoration(
        image: DecorationImage(
            fit: BoxFit.fill,
            image: img == "" ? AssetImage(noPhoto) : NetworkImage(img)),
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        color: Colors.redAccent,
      ),
    );
  }
}

class ItemPrice extends StatelessWidget {
  final String price;
  const ItemPrice({
    Key key,
    this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: SizeConfig.blockSizeVertical,
        // right: SizeConfig.blockSizeHorizontal * 3
      ),
      child: Text(
        NumberFormat.currency(locale: 'eu', symbol: 'KM')
            .format((double.parse(price))),
        style: TextStyle(
          fontSize: SizeConfig.safeBlockHorizontal * 5,
          fontWeight: FontWeight.w700,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}

class OglasTag extends StatelessWidget {
  final String naziv;
  const OglasTag({
    Key key,
    this.naziv,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: SizeConfig.blockSizeHorizontal * 3,
        top: SizeConfig.blockSizeVertical * 1,
        bottom: SizeConfig.blockSizeVertical * 2,
      ),
      child: Text(
        "#" + naziv.replaceAll(new RegExp(r"\s+"), ""),
        style: TextStyle(
          fontSize: SizeConfig.safeBlockHorizontal * 3,
          fontWeight: FontWeight.w300,
          color: Colors.blueAccent,
        ),
      ),
    );
  }
}
