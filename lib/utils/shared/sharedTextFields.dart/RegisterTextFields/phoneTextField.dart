import 'package:Oglasnik/utils/shared/sharedvalidation/registerValidation/phoneValidator.dart';
import 'package:Oglasnik/view/RegistrationPageAuth/pages/register.dart';
import 'package:flutter/material.dart';

class PhoneTextField extends StatelessWidget {
  const PhoneTextField({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(left: 20),
        hintText: 'Broj telefona',
      ),
      controller: signUpPhoneNumberInputController,
      keyboardType: TextInputType.phone,
      validator: phoneValidator,
      textInputAction: TextInputAction.done,
      // focusNode: phonenode,
      onFieldSubmitted: (v) {
        FocusScope.of(context).unfocus();
        //  _calculator();
      },
    );
  }
}
