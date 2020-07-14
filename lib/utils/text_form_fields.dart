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
      child: TextFormField(
        textInputAction: TextInputAction.done,
        onFieldSubmitted: (v) {
          FocusScope.of(context).nextFocus();
        },
        maxLines: null,
        keyboardType: TextInputType.multiline,
        controller: productDescController,
        validator: productFieldsValidator,
        decoration: const InputDecoration(
            labelText: 'Opis', contentPadding: EdgeInsets.only(left: 15.0)),
      ),
    );
  }
}

class NazivTextField extends StatefulWidget {
  const NazivTextField({
    Key key,
  }) : super(key: key);

  @override
  _NazivTextFieldState createState() => _NazivTextFieldState();
}

class _NazivTextFieldState extends State<NazivTextField> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: productNameFormKey,
      child: TextFormField(
        validator: productFieldsValidator,
        controller: productNameController,
        maxLength: 28,
        decoration: const InputDecoration(
            hintText: 'Naziv artikla',
            contentPadding: EdgeInsets.only(left: 15.0)),
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
      ImageOneUpload().img1,
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
      ImageTwoUpload().img2,
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
      ImageThreeUpload().img3,
      style: TextStyle(
        fontSize: 12.0,
        fontWeight: FontWeight.normal,
      ),
    );
  }
}
