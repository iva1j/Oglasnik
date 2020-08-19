import 'dart:async';

import 'package:Oglasnik/utils/margins.dart';
import 'package:Oglasnik/utils/shared/globalVariables.dart';
import 'package:Oglasnik/utils/shared/sharedbuttons/mainAppButtons/redButton.dart';
import 'package:Oglasnik/utils/sizeconfig.dart';
import 'package:flutter/material.dart';

class PageViewButton extends StatelessWidget {
  const PageViewButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      margin: Margin().only(0, 5, 0, 0),
      child: button("Dalje", () async {
        allowAutoValidate = true;
        if (pageController.page == 3) {
          if (productDescFormKey.currentState.validate()) {
            FocusScope.of(context).requestFocus(new FocusNode());
            Timer(Duration(milliseconds: 500), () {
              pageController.nextPage(
                  duration: Duration(milliseconds: 800), curve: Curves.ease);
            });
          } else
            print('molimo popunite polje opis!');
          return null;
        } else if (pageController.page == 2) {
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
          print('key: ' + productCategoryDropDownKey.currentState.toString());
          FocusScope.of(context).requestFocus(new FocusNode());
          Timer(Duration(milliseconds: 500), () {
            pageController.nextPage(
                duration: Duration(milliseconds: 800), curve: Curves.ease);
          });
          return null;
        } else if (pageController.page == 0) {
          if (productNameFormKey.currentState.validate()) {
            FocusScope.of(context).requestFocus(new FocusNode());
            Timer(Duration(milliseconds: 500), () {
              pageController.nextPage(
                  duration: Duration(milliseconds: 800), curve: Curves.ease);
            });
          } else
            print('molimo popunite polje naziv proizvoda!');
          return null;
        }
      }),
    );
  }
}
