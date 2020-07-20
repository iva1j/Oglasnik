import 'package:Oglasnik/utils/shared/sharedvalidation/passwordChangeValidation.dart';
import 'package:Oglasnik/utils/shared/sharedvalidation/registerValidation.dart';
import 'package:Oglasnik/view/RegistrationPageAuth/pages/register.dart';
import 'package:flutter/material.dart';

class NameTextField extends StatelessWidget {
  const NameTextField({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
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

class PasswordTextField extends StatelessWidget {
  const PasswordTextField({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelStyle: TextStyle(),
        hintText: 'Lozinka',
        contentPadding: EdgeInsets.only(left: 20),
      ),
      controller: signUpPasswordInputController,
      keyboardType: TextInputType.visiblePassword,
      obscureText: true,
      textInputAction: TextInputAction.next,
      //  focusNode: lozinkanode,
      onFieldSubmitted: (v) {
        FocusScope.of(context).nextFocus();
      },

      validator: passwordValidator,
    );
  }
}

class EmailTextField extends StatelessWidget {
  const EmailTextField({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: 'Email',
        contentPadding: EdgeInsets.only(left: 20),
      ),
      controller: signUpEmailInputController,
      //keyboardType: TextInputType.emailAddress,
      keyboardType: TextInputType.visiblePassword,
      validator: emailRegisterCheck,
      textInputAction: TextInputAction.next,
      //  focusNode: emailnode,
      onFieldSubmitted: (v) {
        FocusScope.of(context).nextFocus();
      },
    );
  }
}
