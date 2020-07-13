import 'package:Oglasnik/utils/shared/globalVariables.dart';
import 'package:Oglasnik/utils/sizeconfig.dart';
import 'package:Oglasnik/utils/suggestionFunction.dart';
import 'package:Oglasnik/view/PostScreens/pages/cityPage.dart';
import 'package:flutter/material.dart';
import 'package:Oglasnik/view/PostScreens/pages/articlePage.dart';
import 'package:Oglasnik/view/PostScreens/Widgets/custom_dropdown.dart'
    as custom;

class CityDropDown extends StatefulWidget {
  const CityDropDown({
    Key key,
  }) : super(key: key);

  @override
  _CityDropDownState createState() => _CityDropDownState();
}

class _CityDropDownState extends State<CityDropDown> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.screenHeight,
      margin: EdgeInsets.symmetric(horizontal: 35.0),
      child: Card(
        elevation: 16,
        child: Container(
          margin: EdgeInsets.only(left: 5.0, right: 5.0),
          child: Center(
            child: Align(
              alignment: Alignment.topRight,
              child: custom.DropdownButton<String>(
                value: dropdownValueCity,
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
                onChanged: (String newValue) {
                  setState(() {
                    dropdownValueCity = newValue;
                  });
                },
                items: <String>[
                  'Sarajevo',
                  'London',
                  'Lisabon',
                  'Berlin',
                  'New York',
                  'Beč',
                  'Madrid',
                  'Rim',
                  'Bukurešt',
                  'Moskva',
                  'Kopenhagen',
                  'Basel',
                  'Pariz'
                ].map<custom.DropdownMenuItem<String>>(
                    (String productCityValue) {
                  return custom.DropdownMenuItem<String>(
                    value: productCityValue,
                    child: Text(productCityValue),
                  );
                }).toList(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
