import 'package:Oglasnik/utils/shared/globalVariables.dart';
import 'package:Oglasnik/utils/suggestionFunction.dart';
import 'package:Oglasnik/utils/validation.dart';
import 'package:Oglasnik/view/PostScreens/Widgets/pageViewButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

class BrandForm extends StatelessWidget {
  const BrandForm({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: brandFormKey,
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(horizontal: 50.0),
            child: TypeAheadFormField(
              validator: productBrandValidation,
              textFieldConfiguration: TextFieldConfiguration(
                maxLength: 18,
                textCapitalization: TextCapitalization.sentences,
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
              hideOnEmpty: true,
              onSuggestionSelected: (suggestion) {
                brandTypeAheadController.text = suggestion;
              },
            ),
          ),
          PageViewButton(),
        ],
      ),
    );
  }
}