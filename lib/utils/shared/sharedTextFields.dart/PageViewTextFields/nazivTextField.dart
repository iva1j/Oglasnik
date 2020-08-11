import 'package:Oglasnik/model/productModel.dart';
import 'package:Oglasnik/utils/strings.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:Oglasnik/utils/shared/globalVariables.dart';
import 'package:Oglasnik/utils/shared/sharedvalidation/pageViewValidation/productsFieldsValidator.dart';
import 'package:flutter/material.dart';

class NazivTextField extends StatefulWidget {
  const NazivTextField({
    Key key,
    //@required this.editProduct,
    @required this.productSnapshot,
  }) : super(key: key);
  final Product productSnapshot;
  // final String editProduct;
  @override
  _NazivTextFieldState createState() => _NazivTextFieldState();
}

String newText;

class _NazivTextFieldState extends State<NazivTextField> {
  FocusNode _textFocus = new FocusNode();

  void onChange() {
    String text = productNameController.text;
    bool hasFocus = _textFocus.hasFocus;
    //do your text transforming
    productNameController.text = newText;
    productNameController.selection = new TextSelection(
      baseOffset: newText.length,
      extentOffset: newText.length,
    );
  }

  @override
  void initState() {
    productNameController.addListener(onChange);
    _textFocus.addListener(onChange);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.productSnapshot != null) {
      productNameController.text = widget.productSnapshot.productName;
      noviNaziv != null ? productNameController.text = noviNaziv : null;
    }

    return Form(
      key: productNameFormKey,
      //autovalidate: true,
      child: Theme(
        data: ThemeData(
          primaryColor: Colors.black54,
          errorColor: Colors.red,
        ),
        child: TextFormField(
          textCapitalization: TextCapitalization.sentences,
          validator: productFieldsValidator,
          onEditingComplete: () {
            noviNaziv = productNameController.text;
            productName = productNameController.text;
          },
          focusNode: _textFocus,
          // onChanged: (noviNaziv) {
          //   //productNameController.text = noviNaziv;
          //   productName = productNameController.text;
          //   noviNaziv = productNameController.text;
          // },
          inputFormatters: [
            new BlacklistingTextInputFormatter(RegExp(
                '(\u00a9|\u00ae|[\u2000-\u3300]|\ud83c[\ud000-\udfff]|\ud83d[\ud000-\udfff]|\ud83e[\ud000-\udfff])')),
          ],
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
