import 'package:Oglasnik/view/RegisterHome/widgets/itemCardWidgets/itemDescription.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

ItemDescription itemCardDescription(String productDesc) {
  return ItemDescription(
    description: productDesc,
  );
}
