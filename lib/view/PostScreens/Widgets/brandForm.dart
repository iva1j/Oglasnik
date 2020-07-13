import 'package:Oglasnik/utils/shared/globalVariables.dart';
import 'package:Oglasnik/utils/suggestionFunction.dart';
import 'package:Oglasnik/view/PostScreens/Widgets/mainTitle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:Oglasnik/utils/sizeconfig.dart';

class BrandForm extends StatelessWidget {
  const BrandForm({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Form(
      key: brandFormKey,
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(
                bottom: SizeConfig.blockSizeVertical * 13,
                left: SizeConfig.blockSizeHorizontal * 10,
                right: SizeConfig.blockSizeHorizontal * 10),
            child: TypeAheadFormField(
              textFieldConfiguration: TextFieldConfiguration(
                maxLength: 18,
                decoration: InputDecoration(
                    hintText: 'Proizvođač',
                    contentPadding: EdgeInsets.only(left: 15.0)),
                controller: brandTypeAheadController,
              ),
              suggestionsCallback: (pattern) {
                return Proizvodjac.getSuggestions(pattern);
              },
              itemBuilder: (context, suggestion) {
                return ListTile(title: Text(suggestion));
              },
              onSuggestionSelected: (suggestion) {
                brandTypeAheadController.text = suggestion;
              },
            ),
          ),
        ],
      ),
    );
  }
}
