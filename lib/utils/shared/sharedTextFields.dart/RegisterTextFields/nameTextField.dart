import 'package:Oglasnik/utils/shared/sharedvalidation/registerValidation/nameValidator.dart';
import 'package:Oglasnik/view/RegistrationPageAuth/pages/register.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NameTextField extends StatelessWidget {
  const NameTextField({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // inputFormatters: [
      //   new FilteringTextInputFormatter.deny(
      //     RegExp(
      //         r'(\u00a9|\u00ae|[\u2000-\u3300]|\ud83c[\ud000-\udfff]|\ud83d[\ud000-\udfff]|\ud83e[\ud000-\udfff])'),
      //   ),
      // ],
      textCapitalization: TextCapitalization.words,
      decoration: InputDecoration(
        hintText: 'Ime i prezime',
        contentPadding: EdgeInsets.only(left: 20),
      ),
      controller: signUpFullNameInputController,
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.next,
      //  autofocus: true,
      onFieldSubmitted: (v) {
        FocusScope.of(context).nextFocus();
      },
      validator: nameValidator,
    );
  }
}
