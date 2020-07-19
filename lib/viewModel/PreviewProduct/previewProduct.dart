import 'dart:async';

import 'package:Oglasnik/interface/productInterface.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:Oglasnik/interface/productInterface.dart';

Image buildImageWidget(String imagePath) {
  return Image.asset(imagePath);
}

class Citanje extends StatefulWidget {
  @override
  _CitanjeState createState() => _CitanjeState();
}

class _CitanjeState extends State<Citanje> {
  StreamSubscription<QuerySnapshot> subscription;
  List<DocumentSnapshot> snapshot;

  CollectionReference collectionReference =
      Firestore.instance.collection("products");

  @override
  void initState() {
    subscription = collectionReference.snapshots().listen((datasnapshot) {
      setState(() {
        snapshot = datasnapshot.documents;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      margin: EdgeInsets.only(top: 50.0),
      child: ListView(
        children: <Widget>[
          Container(
            height: 300,
            child: ListView.builder(
                itemCount: snapshot.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: Column(
                      children: <Widget>[
                        Text(snapshot[index].data["productCategory"]),
                        Text(snapshot[index].data["cijena"]),
                        Text(snapshot[index].data["productBrand"]),
                      ],
                    ),
                  );
                }),
          )
        ],
      ),
    ));
  }
}
