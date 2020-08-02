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

String dropdownValueCategory = "Automobili";
String dropdownValueBrand = "Audi";
String dropdownValueCity = 'Sarajevo';

//String dropdownValueBrand = 'Brands';

int buttonIdentifier;
bool buttonOne = false;
bool buttonTwo = false;
bool buttonThree = false;
bool allowAutoValidate = false;
bool registeredGlob = false;
bool createdGlob = false;
bool isLoading = false;
bool doesPop = true;

String slika1;

final GlobalKey<FormState> productNameFormKey = GlobalKey<FormState>();
final GlobalKey<FormState> productDescFormKey = GlobalKey<FormState>();
final GlobalKey<FormState> productTagFormKey = GlobalKey<FormState>();
final GlobalKey<FormState> productPriceFormKey = GlobalKey<FormState>();
final GlobalKey<FormState> productCategoryDropDownKey = GlobalKey<FormState>();
final GlobalKey<FormState> productBrandFormKey = GlobalKey<FormState>();

List<String> categoryNames = List<String>();

bool hasInternetConnection = false;

var categoryBrands = Map();
List categoryBrand = [];
List numberofBrands = [];
//var catBrands = Map<String, List<String>>();

List products = [];

class Data {
  List imagesPass;
  Data({this.imagesPass});
}
