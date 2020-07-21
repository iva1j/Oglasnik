import 'package:Oglasnik/utils/shared/globalVariables.dart';
import 'package:Oglasnik/utils/shared/sharedvalidation/pageViewValidation/productPriceValidator.dart';
import 'package:flutter/material.dart';

Container priceTextField() {
  return Container(
      width: 150,
      child: Form(
        // autovalidate: true,
        key: productPriceFormKey,
        child: Theme(
          data: ThemeData(
            primaryColor: Colors.black54,
            errorColor: Colors.red,
          ),
          child: TextFormField(
            decoration: InputDecoration(
              hintText: 'Cijena',
              contentPadding: EdgeInsets.only(left: 15),
            ),
            keyboardType: TextInputType.phone,
            validator: productPriceValidator,
            controller: productPriceController,
          ),
        ),
      ));
}
