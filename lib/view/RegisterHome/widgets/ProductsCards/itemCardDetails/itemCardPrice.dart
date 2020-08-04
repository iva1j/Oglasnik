import 'package:Oglasnik/view/RegisterHome/widgets/itemCardWidgets/itemPrice.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

ItemPrice itemCardPrice(DocumentSnapshot snapshot) {
  return ItemPrice(price: snapshot['cijena']);
}
