import 'dart:async';

import 'package:Oglasnik/utils/shared/globalVariables.dart';
import 'package:Oglasnik/utils/shared/sharedbuttons/mainAppButtons/redButton.dart';
import 'package:Oglasnik/utils/sizeconfig.dart';
import 'package:Oglasnik/utils/strings.dart';
import 'package:Oglasnik/view/RegisterHome/pages/registeredHome.dart';
import 'package:Oglasnik/viewModel/CreateProduct/createProductViewModel.dart';
import 'package:flutter/material.dart';
import 'package:random_string/random_string.dart';

class PageViewButton extends StatelessWidget {
  const PageViewButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      margin: EdgeInsets.only(bottom: SizeConfig.blockSizeVertical * 5),
      child: button("Dalje", () async {
        allowAutoValidate = true;
        if (pageController.page == 4) {
          productName = productNameController.text;
          productCategory = dropdownValueCategory;
          productLocation = dropdownValueCity;
          productTag = productTagController.text;
          productDesc = productDescController.text;

          if (productPriceFormKey.currentState.validate()) {
            FocusScope.of(context).requestFocus(new FocusNode());
            pageController.nextPage(
                duration: Duration(milliseconds: 800), curve: Curves.ease);
            novaCijena = productPriceController.text;
            productprice = productPriceController.text;
            Timer(Duration(seconds: 7), () {
              CreateProduct().createProduct(
                  context,
                  email,
                  phoneNumber,
                  productName,
                  productID = randomAlphaNumeric(20),
                  productCategory,
                  productBrand,
                  productLocation,
                  productTag,
                  productDesc,
                  productImg1,
                  productImg2,
                  productImg3,
                  productprice);
            });
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (_) => RegisteredHome()));
          }
        }
        if (pageController.page == 3) {
          productDesc = productDescController.text;
          noviOpis = productDescController.text;
          print('stari opis je: ' + productDesc.toString());
          print('updateovani opis je: ' + noviOpis.toString());

          if (productDescFormKey.currentState.validate()) {
            FocusScope.of(context).requestFocus(new FocusNode());
            Timer(Duration(milliseconds: 500), () {
              pageController.nextPage(
                  duration: Duration(milliseconds: 800), curve: Curves.ease);
            });
            print(productBrand);
          } else
            print('molimo popunite polje opis!');
          return null;
        } else if (pageController.page == 2) {
          productTag = productTagController.text;
          productLocation = dropdownValueCity;
          noviGrad = dropdownValueCity;
          print('stari tag je: ' + productTag.toString());
          print('updateovani tag je: ' + noviTag.toString());
          // noviTag = productTagController.text;
          if (productTagFormKey.currentState.validate()) {
            FocusScope.of(context).requestFocus(new FocusNode());
            Timer(Duration(milliseconds: 500), () {
              pageController.nextPage(
                  duration: Duration(milliseconds: 800), curve: Curves.ease);
            });
          } else
            print('molimo popunite polje oznake!');
          return null;
        } else if (pageController.page == 1) {
          productCategory = dropdownValueCategory;
          productBrand = dropdownValueBrand;
          novaKategorija = dropdownValueCategory;
          noviBrend = dropdownValueBrand;
          print(dropdownValueCategory);
          print('key: ' + productCategoryDropDownKey.currentState.toString());
          if (dropdownValueCategory != 'Kategorija1' &&
              productCategoryDropDownKey.currentState.toString() !=
                  'Kategorija1') {
            FocusScope.of(context).requestFocus(new FocusNode());
            Timer(Duration(milliseconds: 500), () {
              pageController.nextPage(
                  duration: Duration(milliseconds: 800), curve: Curves.ease);
            });
            print(productBrand);
          } else
            print('Molimo ispravno unesite kategoriju!');
          return null;
        } else if (pageController.page == 0) {
          productName = productNameController.text;
          noviNaziv = productNameController.text;
          if (productNameFormKey.currentState.validate()) {
            FocusScope.of(context).requestFocus(new FocusNode());
            Timer(Duration(milliseconds: 500), () {
              pageController.nextPage(
                  duration: Duration(milliseconds: 800), curve: Curves.ease);
            });

            print(productName);
          } else
            print('molimo popunite polje naziv proizvoda!');
          return null;
        }
      }),
    );
  }
}
