import 'package:Oglasnik/model/productModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

PageController pageController = PageController(initialPage: 0);
final db = Firestore.instance;

String productName,
    email,
    phoneNumber,
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


// GlobalKey<FormState> signUpRegisterFormKey = GlobalKey<FormState>();
// TextEditingController signUpFullNameInputController;
// TextEditingController signUpPhoneNumberInputController;
// TextEditingController signUpEmailInputController;
// TextEditingController signUpPasswordInputController;

//String dropdownValueCategory = 'Kategorija1';
String dropdownValueBrand = 'Brand1';
String dropdownValueCategory = 'Sportska Oprema';
String dropdownValueCity = 'Sarajevo';

final GlobalKey<FormState> productBrandFormKey = GlobalKey<FormState>();

TextEditingController brandTypeAheadController;
int buttonIdentifier;
bool buttonOne = false;
bool buttonTwo = false;
bool buttonThree = false;
bool allowAutoValidate = false;
bool registeredGlob = false;
bool createdGlob = false;

final GlobalKey<FormState> productNameFormKey = GlobalKey<FormState>();
final GlobalKey<FormState> productDescFormKey = GlobalKey<FormState>();
final GlobalKey<FormState> productTagFormKey = GlobalKey<FormState>();
final GlobalKey<FormState> productPriceFormKey = GlobalKey<FormState>();
final GlobalKey<FormState> productCategoryDropDownKey = GlobalKey<FormState>();

List<String> categoryNames = List<String>();

List products = [];

class Data {
  List imagesPass;
  Data({this.imagesPass});
}


