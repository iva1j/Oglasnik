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

TextEditingController signUpFullNameInputController;
TextEditingController signUpPhoneNumberInputController;
TextEditingController signUpEmailInputController;
TextEditingController signUpPasswordInputController;

TextEditingController signInEmailInputController;
TextEditingController signInPasswordInputController;

final GlobalKey<FormState> productBrandFormKey = GlobalKey<FormState>();

TextEditingController brandTypeAheadController;
int buttonIdentifier;
bool buttonOne = false;
bool buttonTwo = false;
bool buttonThree = false;
bool allowAutoValidate = false;
bool registeredGlob = false;
bool createdGlob = false;

String emailSignIn, passwordSignIn;

GlobalKey<FormState> signUpRegisterFormKey = GlobalKey<FormState>();
GlobalKey<FormState> signInLoginFormKey = GlobalKey<FormState>();

final GlobalKey<FormState> productNameFormKey = GlobalKey<FormState>();
final GlobalKey<FormState> productDescFormKey = GlobalKey<FormState>();
final GlobalKey<FormState> productTagFormKey = GlobalKey<FormState>();
final GlobalKey<FormState> productPriceFormKey = GlobalKey<FormState>();

class Data {
  List imagesPass;
  Data({this.imagesPass});
}
