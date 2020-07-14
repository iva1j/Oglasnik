import 'dart:async';

import 'package:Oglasnik/utils/shared/globalVariables.dart';
import 'package:Oglasnik/utils/specialElements.dart';
import 'package:Oglasnik/view/PostScreens/Widgets/imagePageWidget.dart';
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
          email = 'nekimail';
          productName = productNameController.text;
          productCategory = dropdownValueCategory;
          productBrand = brandTypeAheadController.text;
          productLocation = dropdownValueCity;
          productTag = productTagController.text;
          productDesc = productDescController.text;
          productImg1;
          productImg2 = 'adjasdjasp';
          productImg3 = 'adjasdjasp';

          productprice = productPriceController.text;
          print(email + productName + productTag);
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
        } else {
          pageController.nextPage(
              duration: Duration(milliseconds: 800), curve: Curves.ease);
          productName = productNameController.text;
          print(productName);

          print(pageController.toString());
          print(pageController.page);
        }
      }),
    );
  }
}
