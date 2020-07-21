import 'package:Oglasnik/utils/shared/globalVariables.dart';
import 'package:Oglasnik/utils/shared/sharedvalidation/pageViewValidation/productTagValidator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OznakeTextField extends StatelessWidget {
  const OznakeTextField({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      inputFormatters: [
        new FilteringTextInputFormatter.deny(
          RegExp(
              r'(\u00a9|\u00ae|[\u2000-\u3300]|\ud83c[\ud000-\udfff]|\ud83d[\ud000-\udfff]|\ud83e[\ud000-\udfff])'),
        ),
      ],
      textInputAction: TextInputAction.done,
      onFieldSubmitted: (v) {
        FocusScope.of(context).nextFocus();
      },
      controller: productTagController,
      validator: productTagValidation,
      maxLines: null,
      keyboardType: TextInputType.multiline,
      textCapitalization: TextCapitalization.sentences,
      decoration: const InputDecoration(
          hintText: 'Oznake',
          helperText:
              'Oznake razdvojiti zarezom: Sarajevo, zamjena, fulloprema',
          contentPadding: EdgeInsets.only(left: 10.0)),
    );
  }
}
