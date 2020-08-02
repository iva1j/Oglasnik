import 'package:Oglasnik/view/RegisterHome/widgets/itemCardWidgets/itemDescription.dart';
import 'package:flutter/material.dart';

ItemDescription itemCardDescription(AsyncSnapshot snapshot, int index) {
  return ItemDescription(
    description: snapshot.data.documents[index]['productDesc'],
  );
}
