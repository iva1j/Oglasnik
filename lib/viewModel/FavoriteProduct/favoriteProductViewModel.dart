import 'package:Oglasnik/interface/productInterface.dart';
import 'package:Oglasnik/utils/shared/globalVariables.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// Faruk Cidic
///
/// This future builder store favorite products in a list to specific user
///
class FavoriteProduct extends AddFavoriteProductInterface {
  @override
  Future addFavorite(String email, productID) {
    db
        .collection("firestoreUsers")
        .document(email)
        .collection('savedProducts')
        .document(productID)
        .setData({
      'favorite products': [
        productID,
      ],
    });
    return null;
  }
}
