import 'package:Oglasnik/utils/shared/globalVariables.dart';
import 'package:Oglasnik/utils/specialElements.dart';
import 'package:flutter/material.dart';

class PageViewButton extends StatefulWidget {
  const PageViewButton({
    Key key,
  }) : super(key: key);

  @override
  _PageViewButtonState createState() => _PageViewButtonState();
}

class _PageViewButtonState extends State<PageViewButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 140.0),
      child: button("Dalje", () async {
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
