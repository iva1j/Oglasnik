import 'dart:async';

import 'package:Oglasnik/utils/shared/globalVariables.dart';
import 'package:Oglasnik/utils/specialElements.dart';
import 'package:Oglasnik/view/PostScreens/widgets/imagePageWidget.dart';
import 'package:Oglasnik/view/RegisterHome/pages/registeredHome.dart';
import 'package:Oglasnik/viewModel/CreateProduct/createProductViewModel.dart';
import 'package:flutter/material.dart';
import 'package:random_string/random_string.dart';
import 'package:Oglasnik/view/PostScreens/Widgets/imagePageWidget.dart';

class PageViewButton extends StatelessWidget {
  const PageViewButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 140.0),
      child: button("Dalje", () async {
        FocusScope.of(context).requestFocus(new FocusNode());
        if (pageController.page == 4) {
          productName = productNameController.text;
          productCategory = dropdownValueCategory;
          productBrand = brandTypeAheadController.text;
          productLocation = dropdownValueCity;
          productTag = productTagController.text;
          productDesc = productDescController.text;

          if (productPriceFormKey.currentState.validate()) {
            productprice = productPriceController.text;
            Timer(Duration(seconds: 7), () {
              CreateProduct().createProduct(
                  context,
                  email,
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
          if (productDescFormKey.currentState.validate()) {
            pageController.nextPage(
                duration: Duration(milliseconds: 800), curve: Curves.ease);
            print(productBrand);
          } else
            print('molimo popunite polje opis!');
          return null;
        } else if (pageController.page == 2) {
          productTag = productTagController.text;
          productLocation = dropdownValueCity;
          if (productTagFormKey.currentState.validate()) {
            pageController.nextPage(
                duration: Duration(milliseconds: 800), curve: Curves.ease);
            print(productBrand);
          } else
            print('molimo popunite polje oznake!');
          return null;
        } else if (pageController.page == 1) {
          productCategory = dropdownValueCategory;
          productBrand = brandTypeAheadController.text;
          if (brandFormKey.currentState.validate()) {
            pageController.nextPage(
                duration: Duration(milliseconds: 800), curve: Curves.ease);
            print(productBrand);
          } else
            print('molimo popunite polje proizvodjac!');
          return null;
        } else if (pageController.page == 0) {
          productName = productNameController.text;
          if (productNameFormKey.currentState.validate()) {
            pageController.nextPage(
                duration: Duration(milliseconds: 800), curve: Curves.ease);
            print(productName);
          } else
            print('molimo popunite polje naziv proizvoda!');
          return null;
        }
      }),
    );
  }
}
