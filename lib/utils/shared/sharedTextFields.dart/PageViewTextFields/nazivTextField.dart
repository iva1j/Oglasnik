import 'package:Oglasnik/utils/shared/globalVariables.dart';
import 'package:Oglasnik/utils/shared/sharedvalidation/pageViewValidation/productsFieldsValidator.dart';
import 'package:Oglasnik/utils/strings.dart';
import 'package:flutter/material.dart';

class NazivTextField extends StatefulWidget {
  const NazivTextField({
    Key key,
  }) : super(key: key);

  @override
  _NazivTextFieldState createState() => _NazivTextFieldState();
}

class _NazivTextFieldState extends State<NazivTextField> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: productNameFormKey,
      //autovalidate: true,
      child: Theme(
        data: ThemeData(
          primaryColor: Colors.black54,
          errorColor: Colors.red,
        ),
        child: TextFormField(
          validator: productFieldsValidator,
          textCapitalization: TextCapitalization.sentences,
          controller: productNameController,
          maxLength: 28,
          decoration: const InputDecoration(
              hintText: 'Naziv artikla',
              contentPadding: EdgeInsets.only(left: 15.0)),
        ),
      ),
    );
  }
}
