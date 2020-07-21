import 'package:Oglasnik/utils/shared/globalVariables.dart';
import 'package:Oglasnik/utils/shared/sharedvalidation/pageViewValidation/productDescValidator.dart';
import 'package:flutter/material.dart';

class OpisTextField extends StatelessWidget {
  const OpisTextField({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: productDescFormKey,
      //autovalidate: true,
      child: Theme(
        data: ThemeData(
          primaryColor: Colors.black54,
          errorColor: Colors.red,
        ),
        child: TextFormField(
          textInputAction: TextInputAction.done,
          onFieldSubmitted: (v) {
            FocusScope.of(context).nextFocus();
          },
          validator: productDescValidation,
          maxLines: null,
          keyboardType: TextInputType.multiline,
          controller: productDescController,
          textCapitalization: TextCapitalization.sentences,
          decoration: const InputDecoration(
            labelText: 'Opis',
            contentPadding: EdgeInsets.only(left: 15.0),
          ),
        ),
      ),
    );
  }
}
