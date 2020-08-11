import 'package:Oglasnik/model/productModel.dart';
import 'package:Oglasnik/utils/shared/globalVariables.dart';
import 'package:Oglasnik/utils/sizeconfig.dart';
import 'package:Oglasnik/utils/suggestionFunction.dart';
import 'package:Oglasnik/view/PostScreens/Widgets/pageViewButton.dart';
import 'package:flutter/material.dart';
import 'package:Oglasnik/view/PostScreens/Widgets/custom_dropdown.dart'
    as custom;
import 'package:Oglasnik/view/PostScreens/Widgets/custom2_dropdown.dart'
    as custom2;

class CategoryPage extends StatefulWidget {
  const CategoryPage({
    Key key,
    @required this.productSnapshot,
    @required this.editProduct,
  }) : super(key: key);

  final String editProduct;
  final Product productSnapshot;
  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    /*
    if (widget.productSnapshot != null) {
      dropdownValueCategory = widget.productSnapshot.productCategory;
      dropdownValueBrand = widget.productSnapshot.productBrand;
      novaKategorija != null ? dropdownValueCategory = novaKategorija : null;
      noviBrend != null ? dropdownValueBrand = noviBrend : null;
    }
*/
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
                  // MainTitle(
                  //   editProduct: widget.editProduct,
                  // ),
                  Container(
                    margin: EdgeInsets.only(
                      top: SizeConfig.blockSizeVertical * 22,
                      left: SizeConfig.blockSizeHorizontal * 10,
                      right: SizeConfig.blockSizeHorizontal * 10,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: SizeConfig.blockSizeHorizontal * 9,
                    ),
                    child: Card(
                        elevation: 16,
                        child: Container(
                            margin: EdgeInsets.only(
                              left: SizeConfig.blockSizeHorizontal * 5,
                              right: SizeConfig.blockSizeHorizontal * 2,
                            ),
                            child: Center(
                                child: Align(
                                    alignment: Alignment.topRight,
                                    child: custom.DropdownButton<String>(
                                      selectedItemBuilder:
                                          (BuildContext context) {
                                        return categoryNames
                                            .map<Widget>((String item) {
                                          return Text(item);
                                        }).toList();
                                      },
                                      value: createSwitcher
                                          ? dropdownValueCategory
                                          : updateDropdownValueCategory,
                                      height:
                                          MediaQuery.of(context).size.height /
                                              2.229,
                                      icon: Icon(Icons.arrow_drop_down),
                                      iconSize: 24,
                                      elevation: 16,
                                      isExpanded: true,
                                      style: TextStyle(
                                        color: Colors.black87,
                                        fontSize:
                                            SizeConfig.safeBlockHorizontal * 4,
                                        height: 1.5,
                                      ),
                                      underline: Container(),
                                      onChanged: (String productCategoryList) =>
                                          setState(
                                        () => {
                                          if (createSwitcher)
                                            {
                                              dropdownValueCategory =
                                                  productCategoryList,
                                              dropdownValueBrand =
                                                  categoryBrands[
                                                      dropdownValueCategory][0],
                                            }
                                          else
                                            {
                                              updateDropdownValueCategory =
                                                  productCategoryList,
                                              updateDropdownValueBrand =
                                                  categoryBrands[
                                                      updateDropdownValueCategory][0],
                                            }
                                        },
                                      ),
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
                    margin: EdgeInsets.symmetric(
                        horizontal: SizeConfig.blockSizeHorizontal * 9,
                        vertical: SizeConfig.blockSizeVertical * 3),
                    child: Card(
                      elevation: 16,
                      child: Container(
                        margin: EdgeInsets.only(
                          left: SizeConfig.blockSizeHorizontal * 5,
                          right: SizeConfig.blockSizeHorizontal * 2,
                        ),
                        child: Center(
                          child: Align(
                            alignment: Alignment.topRight,
                            child: custom2.DropdownButton<String>(
                              value: createSwitcher
                                  ? dropdownValueBrand
                                  : updateDropdownValueBrand,
                              disabledHint: Text('Molimo odaberite kategoriju'),
                              height:
                                  MediaQuery.of(context).size.height / 2.229,
                              icon: Icon(Icons.arrow_drop_down),
                              iconSize: 24,
                              elevation: 16,
                              isExpanded: true,
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: SizeConfig.safeBlockHorizontal * 4,
                                height: 1.5,
                              ),
                              underline: Container(),
                              onChanged: (String productBrandList) =>
                                  setState(() {
                                if (createSwitcher)
                                  dropdownValueBrand =
                                      productBrandList; // u productBrandList treba povući vrijednosti iz Firestora ali imajući u vidu kategoriju koja se odabere (prvi brand iz kategorije)
                                else
                                  updateDropdownValueBrand = productBrandList;
                              }),
                              items: List<String>.from(categoryBrands[
                                      createSwitcher
                                          ? dropdownValueCategory
                                          : updateDropdownValueCategory])
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
