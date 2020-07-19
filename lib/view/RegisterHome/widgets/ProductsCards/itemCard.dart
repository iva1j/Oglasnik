import 'package:Oglasnik/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:Oglasnik/utils/sizeconfig.dart';
import 'package:flutter/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ItemCard extends StatelessWidget {
  String img = "assets/images/audi.jpg";

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        body: StreamBuilder(
            stream: Firestore.instance.collection('products').snapshots(),
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
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                      border: Border.all(
                        color: Colors.black,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    margin: EdgeInsets.symmetric(
                      horizontal: SizeConfig.blockSizeHorizontal * 5,
                      vertical: SizeConfig.blockSizeVertical * 10,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  ItemName(
                                    name: snapshot.data.documents[index]
                                        ['productName'],
                                  ),
                                  ItemDescription(
                                    description: snapshot.data.documents[index]
                                        ['productDesc'],
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                children: <Widget>[
                                  ItemImage(
                                      img: snapshot.data.documents[index]
                                                  ['productImg1'] !=
                                              null
                                          ? snapshot.data.documents[index]
                                              ['productImg1']
                                          : img),
                                  ItemPrice(
                                      price: "Cijena: " +
                                          snapshot.data.documents[index]
                                              ['cijena'] +
                                          " KM"),
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
                            children: <Widget>[
                              OglasTag(naziv: "Sarajevo"),
                              OglasTag(naziv: "Audi"),
                              OglasTag(naziv: "Top"),
                              OglasTag(naziv: "Sarajevo"),
                              OglasTag(naziv: "Audi"),
                              OglasTag(naziv: "Top"),
                              OglasTag(naziv: "Sarajevo"),
                              OglasTag(naziv: "Audi"),
                              OglasTag(naziv: "Top"),
                              OglasTag(naziv: "Sarajevo"),
                              OglasTag(naziv: "Audi"),
                              OglasTag(naziv: "Top"),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            }));
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
        top: SizeConfig.blockSizeVertical,
      ),
      height: SizeConfig.blockSizeVertical * 20,
      width: SizeConfig.blockSizeVertical * 20,
      decoration: BoxDecoration(
        image: DecorationImage(
            fit: BoxFit.fill,
            image: img == null ? AssetImage(img) : NetworkImage(img)),
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
      ),
      child: Text(
        price,
        style: TextStyle(
          fontSize: SizeConfig.safeBlockHorizontal * 5,
          fontWeight: FontWeight.w700,
        ),
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
        "#" + naziv,
        style: TextStyle(
          fontSize: SizeConfig.safeBlockHorizontal * 3,
          fontWeight: FontWeight.w300,
          color: Colors.blueAccent,
        ),
      ),
    );
  }
}
