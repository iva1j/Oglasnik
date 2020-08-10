import 'package:Oglasnik/model/productModel.dart';
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

class _NazivTextFieldState extends State<NazivTextField> {

  @override
  Widget build(BuildContext context) {
    productNameController.text = widget.productSnapshot.productName;
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
          inputFormatters: [
            new BlacklistingTextInputFormatter(RegExp(
                '(\u00a9|\u00ae|[\u2000-\u3300]|\ud83c[\ud000-\udfff]|\ud83d[\ud000-\udfff]|\ud83e[\ud000-\udfff])')),
          ],
          controller: productNameController,
          maxLength: 28,
          decoration: const InputDecoration(
              contentPadding: EdgeInsets.only(left: 15.0)),
        ),
      ),
    );
  }
}
