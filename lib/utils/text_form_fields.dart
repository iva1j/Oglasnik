import 'package:Oglasnik/utils/shared/globalVariables.dart';
import 'package:Oglasnik/utils/validation.dart';
import 'package:flutter/material.dart';

Container priceTextField() {
  return Container(
    width: 150,
    child: TextFormField(
      decoration: InputDecoration(
        hintText: 'Cijena',
        contentPadding: EdgeInsets.only(left: 15),
      ),
      keyboardType: TextInputType.phone,
      validator: priceValidator,
      controller: productPriceController,
    ),
  );
}
