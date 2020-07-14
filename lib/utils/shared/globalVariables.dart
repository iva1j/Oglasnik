import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

PageController pageController = PageController(initialPage: 0);
final db = Firestore.instance;

String productName,
    email,
    productID,
    productCategory,
    productBrand,
    productLocation,
    productTag,
    productDesc,
    productImg1,
    productImg2,
    productImg3,
    productprice;

TextEditingController productNameController;
TextEditingController productTagController;
TextEditingController productDescController;
TextEditingController productPriceController;
String dropdownValueCategory = 'Kategorija1';
String dropdownValueCity = 'Sarajevo';

GlobalKey<FormState> productNameFormKey = GlobalKey<FormState>();
GlobalKey<FormState> productTagFormKey = GlobalKey<FormState>();
GlobalKey<FormState> productDescFormKey = GlobalKey<FormState>();
GlobalKey<FormState> productPriceFormKey = GlobalKey<FormState>();

final GlobalKey<FormState> brandFormKey = GlobalKey<FormState>();
TextEditingController brandTypeAheadController;

bool uploadSlike = false;
