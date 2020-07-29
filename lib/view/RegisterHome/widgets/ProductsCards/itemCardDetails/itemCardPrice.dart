import 'package:Oglasnik/view/RegisterHome/widgets/itemCardWidgets/itemPrice.dart';
import 'package:flutter/material.dart';

ItemPrice itemCardPrice(AsyncSnapshot snapshot, int index) {
  return ItemPrice(price: snapshot.data.documents[index]['cijena']);
}
