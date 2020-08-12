import 'package:Oglasnik/model/productModel.dart';
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

  @override
  Widget build(BuildContext context) {
    /*
    if (widget.productSnapshot != null) {
      
      noviNaziv != null ? productNameController.text = noviNaziv : null;
    }*/

    //print(productNameController.text);
    return Form(
      key: productNameFormKey,
      //autovalidate: true,
      child: Theme(
        data: ThemeData(
          primaryColor: Colors.black54,
          errorColor: Colors.red,
        ),
        child: TextFormField(
          autocorrect: false,
          initialValue: createSwitcher
              ? newProductNameReturn == null ? "" : newProductNameReturn
              : updateProductNameReturn == null
                  ? updateProductName
                  : updateProductNameReturn,
          onChanged: (value) {
            if (!createSwitcher)
              updateProductNameReturn = value;
            else
              newProductNameReturn = value;
          },
          textCapitalization: TextCapitalization.sentences,
          validator: productFieldsValidator,
          inputFormatters: [
            new BlacklistingTextInputFormatter(RegExp(
                '(\u00a9|\u00ae|[\u2000-\u3300]|\ud83c[\ud000-\udfff]|\ud83d[\ud000-\udfff]|\ud83e[\ud000-\udfff])')),
          ],
          //controller: productNameController,
          maxLength: 28,
          decoration: const InputDecoration(
              hintText: 'Naziv artikla',
              contentPadding: EdgeInsets.only(left: 15.0)),
        ),
      ),
    );
  }
}
