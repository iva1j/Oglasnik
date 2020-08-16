import 'package:Oglasnik/model/productModel.dart';
import 'package:Oglasnik/utils/shared/globalVariables.dart';
import 'package:Oglasnik/utils/shared/sharedvalidation/pageViewValidation/productDescValidator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OpisTextField extends StatelessWidget {
  const OpisTextField({
    Key key,
    @required this.productSnapshot,
  }) : super(key: key);
  final Product productSnapshot;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: productDescFormKey,
      child: Theme(
        data: ThemeData(
          primaryColor: Colors.black54,
          errorColor: Colors.red,
        ),
        child: TextFormField(
          //extract
          initialValue: createSwitcher
              ? newProductDescriptionReturn == null
                  ? ""
                  : newProductDescriptionReturn
              : updateProductDescriptionReturn == null
                  ? updateProductDescription
                  : updateProductDescriptionReturn,
          onChanged: (value) {
            if (!createSwitcher)
              updateProductDescriptionReturn = value;
            else
              newProductDescriptionReturn = value;
          },
          inputFormatters: [
            new BlacklistingTextInputFormatter(RegExp(
                '(\u00a9|\u00ae|[\u2000-\u3300]|\ud83c[\ud000-\udfff]|\ud83d[\ud000-\udfff]|\ud83e[\ud000-\udfff])')),
          ],
          textInputAction: TextInputAction.done,
          onFieldSubmitted: (v) {
            FocusScope.of(context).nextFocus();
          },
          validator: productDescValidation,
          maxLines: null,
          keyboardType: TextInputType.multiline,
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
