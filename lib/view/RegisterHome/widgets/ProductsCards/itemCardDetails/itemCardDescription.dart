import 'package:Oglasnik/view/RegisterHome/widgets/itemCardWidgets/itemDescription.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

ItemDescription itemCardDescription(DocumentSnapshot snapshott) {
  return ItemDescription(
    description: snapshott['productDesc'],
  );
}
