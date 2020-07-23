/*import 'package:Oglasnik/utils/groupOfFunctions.dart';
import 'package:Oglasnik/utils/shared/globalVariables.dart';
import 'package:Oglasnik/utils/sizeconfig.dart';
import 'package:Oglasnik/utils/suggestionFunction.dart';
import 'package:Oglasnik/view/PostScreens/Widgets/brandForm.dart';
import 'package:Oglasnik/view/PostScreens/Widgets/categoryDropDown.dart';
import 'package:Oglasnik/view/PostScreens/Widgets/mainTitle.dart';
import 'package:Oglasnik/view/PostScreens/Widgets/pageViewButton.dart';
import 'package:flutter/material.dart';

class CategoryPage extends StatefulWidget {
  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  void dispose() {
    pageTwoDisposeControllers();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final bottom = MediaQuery.of(context).viewInsets.bottom;

    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus &&
            currentFocus.focusedChild != null) {
          currentFocus.focusedChild.unfocus();
        }
      },
      child: WillPopScope(
        onWillPop: () => Future.sync(onWillPop),
        child: Scaffold(
          resizeToAvoidBottomPadding: false,
          body: SingleChildScrollView(
            reverse: true,
            child: Padding(
              padding: EdgeInsets.only(bottom: bottom),
              child: Column(
                children: <Widget>[
                  MainTitle(),
                  Container(
                    margin: EdgeInsets.only(
                      top: SizeConfig.blockSizeVertical * 10,
                      left: SizeConfig.blockSizeHorizontal * 10,
                      right: SizeConfig.blockSizeHorizontal * 10,
                    ),
                  ),
                  CategoryDropDown(),
                  BrandForm(),
                  PageViewButton(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
*/

import 'package:Oglasnik/utils/groupOfFunctions.dart';
import 'package:Oglasnik/utils/shared/globalVariables.dart';
import 'package:Oglasnik/utils/sizeconfig.dart';
import 'package:Oglasnik/utils/suggestionFunction.dart';

import 'package:Oglasnik/view/PostScreens/Widgets/mainTitle.dart';
import 'package:Oglasnik/view/PostScreens/Widgets/pageViewButton.dart';
import 'package:flutter/material.dart';
import 'package:Oglasnik/view/PostScreens/Widgets/custom_dropdown.dart'
    as custom;
import 'package:Oglasnik/view/PostScreens/Widgets/custom2_dropdown.dart'
    as custom2;

class CategoryPage extends StatefulWidget {
  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  void dispose() {
    pageTwoDisposeControllers();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final bottom = MediaQuery.of(context).viewInsets.bottom;

    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus &&
            currentFocus.focusedChild != null) {
          currentFocus.focusedChild.unfocus();
        }
      },
      child: WillPopScope(
        onWillPop: () => Future.sync(onWillPop),
        child: Scaffold(
          resizeToAvoidBottomPadding: false,
          body: SingleChildScrollView(
            reverse: true,
            child: Padding(
              padding: EdgeInsets.only(bottom: bottom),
              child: Column(
                children: <Widget>[
                  MainTitle(),
                  Container(
                    margin: EdgeInsets.only(
                      top: SizeConfig.blockSizeVertical * 18,
                      left: SizeConfig.blockSizeHorizontal * 10,
                      right: SizeConfig.blockSizeHorizontal * 10,
                    ),
                  ),
                  Container(
                    margin:
                        EdgeInsets.symmetric(horizontal: 35.0, vertical: 20.0),
                    child: Card(
                        elevation: 16,
                        child: Container(
                            margin: EdgeInsets.only(left: 5.0, right: 5.0),
                            child: Center(
                                child: Align(
                                    alignment: Alignment.topRight,
                                    child: custom.DropdownButton<String>(
                                      value: dropdownValueCategory,
                                      height:
                                          MediaQuery.of(context).size.height /
                                              2.229,
                                      icon: Icon(Icons.arrow_drop_down),
                                      iconSize: 24,
                                      elevation: 16,
                                      isExpanded: true,
                                      style: TextStyle(
                                        color: Colors.black87,
                                        fontSize: 14,
                                        height: 1.5,
                                      ),
                                      underline: Container(),
                                      onChanged: (String productCategoryList) =>
                                          setState(() => {
                                                dropdownValueCategory =
                                                    productCategoryList,
                                                dropdownValueBrand =
                                                    categoryBrands[
                                                        dropdownValueCategory][0],
                                              }),
                                      items: categoryNames
                                          .map<custom.DropdownMenuItem<String>>(
                                              (String value) {
                                        return custom.DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value),
                                        );
                                      }).toList(),
                                    ))))),
                  ),
                  Container(
                    margin:
                        EdgeInsets.symmetric(horizontal: 35.0, vertical: 20.0),
                    child: Card(
                      elevation: 16,
                      child: Container(
                        margin: EdgeInsets.only(left: 5.0, right: 5.0),
                        child: Center(
                          child: Align(
                            alignment: Alignment.topRight,
                            child: custom2.DropdownButton<String>(
                              value: dropdownValueBrand,
                              disabledHint: Text('Molimo odaberite kategoriju'),
                              height:
                                  MediaQuery.of(context).size.height / 2.229,
                              icon: Icon(Icons.arrow_drop_down),
                              iconSize: 24,
                              elevation: 16,
                              isExpanded: true,
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 14,
                                height: 1.5,
                              ),
                              underline: Container(),
                              onChanged:
                                  // (dropdownValueCategory == 'Kategorija1')
                                  //     ? null
                                  //     :
                                  (String productBrandList) => setState(() {
                                dropdownValueBrand =
                                    productBrandList; // u productBrandList treba povući vrijednosti iz Firestora ali imajući u vidu kategoriju koja se odabere (prvi brand iz kategorije)
                              }),
                              items: List<String>.from(
                                      categoryBrands[dropdownValueCategory])
                                  .map<custom2.DropdownMenuItem<String>>(
                                      (String value) {
                                return custom2.DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.blockSizeVertical * 11.5,
                  ),
                  PageViewButton(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
