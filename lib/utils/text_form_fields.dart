import 'package:Oglasnik/utils/shared/globalVariables.dart';
import 'package:Oglasnik/utils/strings.dart';
import 'package:Oglasnik/utils/validation.dart';
import 'package:flutter/material.dart';

Container priceTextField() {
  return Container(
    width: 150,
    child: Form(
      key: productPriceFormKey,
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
  );
}

class OpisTextField extends StatelessWidget {
  const OpisTextField({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: productDescFormKey,
      autovalidate: true,
      child: Theme(
        data: ThemeData(
          primaryColor: Colors.black54,
          errorColor: Colors.red,
        ),
        child: TextFormField(
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

class NazivTextField extends StatelessWidget {
  const NazivTextField({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: productNameFormKey,
      autovalidate: true,
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

class AddImageOne extends StatelessWidget {
  const AddImageOne({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      img1,
      style: TextStyle(
        fontSize: 12.0,
        fontWeight: FontWeight.normal,
      ),
    );
  }
}

class AddImageTwo extends StatelessWidget {
  const AddImageTwo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      img2,
      style: TextStyle(
        fontSize: 12.0,
        fontWeight: FontWeight.normal,
      ),
    );
  }
}

class AddImageThree extends StatelessWidget {
  const AddImageThree({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      img3,
      style: TextStyle(
        fontSize: 12.0,
        fontWeight: FontWeight.normal,
      ),
    );
  }
}
