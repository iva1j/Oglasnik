import 'package:Oglasnik/utils/shared/globalVariables.dart';
import 'package:flutter/material.dart';
import 'package:Oglasnik/view/PostScreens/Widgets/custom_dropdown.dart'
    as custom;

class CategoryDropDown extends StatefulWidget {
  const CategoryDropDown({
    Key key,
  }) : super(key: key);

  @override
  _CategoryDropDownState createState() => _CategoryDropDownState();
}

class _CategoryDropDownState extends State<CategoryDropDown> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 35.0, vertical: 20.0),
      child: Card(
          elevation: 16,
          child: Container(
              margin: EdgeInsets.only(left: 5.0, right: 5.0),
              child: Center(
                  child: Align(
                      alignment: Alignment.topRight,
                      child: custom.DropdownButton<String>(
                        value: dropdownValueCategory,
                        height: MediaQuery.of(context).size.height / 2.229,
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
                        onChanged: (String productCategoryList) => setState(
                            () => dropdownValueCategory = productCategoryList),
                        items: <String>[
                          'Kategorija1',
                          'Kategorija2',
                          'Kategorija3',
                          'Kategorija4',
                          'Kategorija5',
                          'Kategorija6',
                          'Kategorija7',
                          'Kategorija8',
                          'Kategorija9',
                          'Kategorija10',
                          'Kategorija11',
                          'Kategorija12',
                          'Kategorija13'
                        ].map<custom.DropdownMenuItem<String>>((String value) {
                          return custom.DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ))))),
    );
  }
}
