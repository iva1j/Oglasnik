import 'package:Oglasnik/utils/validation.dart';
import 'package:flutter/material.dart';

Container priceTextField() {
  return Container(
    width: 150,
    child: TextFormField(
      decoration: InputDecoration(
        hintText: 'Cijena',
        contentPadding: EdgeInsets.only(left: 20),
      ),
      keyboardType: TextInputType.text,
      validator: priceValidator,
    ),
  );
}
