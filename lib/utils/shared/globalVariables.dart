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

GlobalKey<FormState> signUpRegisterFormKey =
    new GlobalKey<FormState>(debugLabel: 'signUpRegisterFormKey');
GlobalKey<FormState> signInRegisterFormKey =
    new GlobalKey<FormState>(debugLabel: 'signInRegisterFormKey');

GlobalKey<FormState> passwordChangeFormKey =
    new GlobalKey<FormState>(debugLabel: 'passwordChangeFormKey');
GlobalKey<FormState> alertFormKey =
    new GlobalKey<FormState>(debugLabel: 'alertFormKey');

GlobalKey<FormState> globalKeyPass() => passwordChangeFormKey;

// TextEditingController signUpFullNameInputController;
// TextEditingController signUpPhoneNumberInputController;
// TextEditingController signUpEmailInputController;
// TextEditingController signUpPasswordInputController;

//String dropdownValueCategory = 'Kategorija1';

String dropdownValueCategory = "Automobili";
String dropdownValueBrand = "Audi";
String updateDropdownValueCategory;
String updateDropdownValueBrand;
String updateProductName;
String updateProductPrice;
String updateProductTags;
String updateProductDescription;
String dropdownValueCity = 'Sarajevo';
String updateDropdownValueCity;

String newProductNameReturn,
    newProductTagsReturn,
    newProductDescriptionReturn,
    newProductPriceReturn;

String updateProductNameReturn,
    updateProductTagsReturn,
    updateProductDescriptionReturn,
    updateProductPriceReturn;

String updateProfileName, updateProfilePhoneNumber, updateProfileEmail, updateProfilePassword;

String forgetEmail;

String updateProfileNameReturn,
    updateProfilePhoneNumberReturn,
    updateProfileEmailReturn;

String image1Name, image2Name, image3Name;

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

final GlobalKey<FormState> updateproductNameFormKey = GlobalKey<FormState>();

List<String> categoryNames = List<String>();

bool hasInternetConnection = false;

///global variable that is true for 3 sec, when user wants to add more then 3 cities in filters
bool flushbarChecker = false;

var categoryBrands = Map();
List categoryBrand = [];
List numberofBrands = [];
var allBrands;
//var catBrands = Map<String, List<String>>();

List products = [];

class Data {
  List imagesPass;
  Data({this.imagesPass});
}

bool createSwitcher = false;
bool azurload = false;
bool isDeleteShown1 = false;
bool isDeleteShown2 = false;
bool isDeleteShown3 = false;

String oldProductID;
