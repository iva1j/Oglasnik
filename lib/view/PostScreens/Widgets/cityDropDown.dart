import 'package:Oglasnik/utils/shared/globalVariables.dart';
import 'package:Oglasnik/utils/sizeconfig.dart';
import 'package:Oglasnik/utils/strings.dart';
import 'package:flutter/material.dart';
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
    SizeConfig().init(context);
    return Container(
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
                value: dropdownValueCity,
                height: MediaQuery.of(context).size.height / 2.229,
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
                onChanged: (String newValue) {
                  setState(() {
                    dropdownValueCity = newValue;
                  });
                },
                items: cityDropdownItems.map<custom.DropdownMenuItem<String>>(
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
