import 'package:Oglasnik/utils/shared/globalVariables.dart';
import 'package:Oglasnik/utils/specialElements.dart';
import 'package:Oglasnik/viewModel/CreateProduct/createProductViewModel.dart';
import 'package:flutter/material.dart';
import 'package:random_string/random_string.dart';

class PageViewButtonSubmit extends StatefulWidget {
  @override
  _PageViewButtonSubmitState createState() => _PageViewButtonSubmitState();
}

class _PageViewButtonSubmitState extends State<PageViewButtonSubmit> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 140.0),
      child: button(
        "Završi",
        () async {
          if (pageController.page == 4) {
            email = 'nekimail';
            productImg1 = 'slika1';
            productImg2 = 'slika2';
            productImg3 = 'slika3';
            productprice = productPriceController.text;
            if (productPriceFormKey.currentState.validate())
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
            else
              return null;
          }
        },
      ),
    );
  }
}
