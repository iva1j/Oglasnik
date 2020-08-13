import 'package:Oglasnik/interface/productInterface.dart';
import 'package:Oglasnik/model/productModel.dart';
import 'package:Oglasnik/utils/shared/globalVariables.dart';
import 'package:Oglasnik/utils/strings.dart';
import 'package:Oglasnik/viewModel/SplashViewModel/splashViewModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// Faruk Cidic
///
/// This future builder store favorite products in a list to specific user
///
class FavoriteProduct extends AddFavoriteProductInterface {
  @override
  Future addFavorite(String email, DocumentSnapshot product) {
    db
        .collection("firestoreUsers")
        .document(email)
        .collection('savedProducts')
        .document(product["productID"])
        .setData({
      'productID': product["productID"],
      // 'favorite products': [
      //   product.productID,
      // ],
      // 'email': email,
      // 'phoneNumber': product.phoneNumber,
      // 'productName': product.productName,
      // 'productCategory': product.productCategory,
      // 'productBrand': product.productBrand,
      // 'productLocation': product.productLocation,
      // 'cijena': product.productCijena,
      // 'productTag': product.productTag,
      // 'productFinished': false,
      // 'productDesc': product.productDesc,
      // 'productImg1': product.productImg1,
      // 'productImg2': product.productImg2,
      // 'productImg3': product.productImg3,
    });
    return null;
  }

  Future removeFavorite(String email, DocumentSnapshot product) {
    db
        .collection("firestoreUsers")
        .document(email)
        .collection('savedProducts')
        .document(product["productID"])
        .delete();

    return null;
  }

  Future isProductFavorite(Product product) async {
    // final QuerySnapshot results = await Firestore.instance
    //     .collection('firestoreUsers')
    //     .document(email)
    //     .collection('savedProducts')
    //     .where('productID', isEqualTo: product.productID)
    //     .getDocuments();
    // final List<DocumentSnapshot> document = results.documents;
/*
    if (listaProizvoda.contains(product.productID)) {
      favorite = true;
      FavoriteProduct().removeFavorite(email, product);
      print("Proizvod već postoji u bazi: " + favorite.toString());
    } else {
      favorite = false;
      print('ne postoji proizvod, upravo smo ga dodali');
      FavoriteProduct().addFavorite(email, product);
    }*/

    List<DocumentSnapshot> allFavs = await getAllFavoritesIDs();

    for (final x in allFavs) {
      if (product.productID == x['productID']) return true;
    }

    return false;
  }

  Future getAllFavoritesIDs() async {
    final QuerySnapshot favorites = await Firestore.instance
        .collection('firestoreUsers')
        .document(email)
        .collection('savedProducts')
        .getDocuments();

    List<DocumentSnapshot> favoritesDocs = favorites.documents;

    return favoritesDocs;
  }

  Future getAllUnfinishedProducts() async {
    final QuerySnapshot favoritesProducts = await Firestore.instance
        .collection('products')
        .where('productFinished', isEqualTo: false)
        .getDocuments();

    List<DocumentSnapshot> productsDocs = favoritesProducts.documents;

    return productsDocs;
  }

  Future listAllFavorites() async {
    List<DocumentSnapshot> favsIDs = await getAllFavoritesIDs();
    List<DocumentSnapshot> allProds = await getAllUnfinishedProducts();

    List<DocumentSnapshot> retList = List<DocumentSnapshot>();

    for (int i = 0; i < favsIDs.length; i++) {
      for (int j = 0; j < allProds.length; j++) {
        if (favsIDs[i]['productID'] == allProds[j]['productID']) {
          retList.add(allProds[j]);
          break;
        }
      }
    }
    return retList;
  }
}
