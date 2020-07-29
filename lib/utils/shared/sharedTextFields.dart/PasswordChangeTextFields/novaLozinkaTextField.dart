import 'package:Oglasnik/utils/shared/sharedvalidation/tokenandpassValidation/passValidator.dart';
import 'package:Oglasnik/view/PasswordChange/pages/passwordChange.dart';
import 'package:flutter/material.dart';

class NovaLozinka extends StatelessWidget {
  const NovaLozinka({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: EdgeInsets.only(bottom: 10),
      child: new SizedBox(
        width: double.infinity,
        child: Container(
          child: TextFormField(
            textInputAction: TextInputAction.next,
            onFieldSubmitted: (v) {
              FocusScope.of(context).nextFocus();
            },
            decoration: InputDecoration(
              hintText: 'Nova lozinka',
              contentPadding: EdgeInsets.only(left: 10),
            ),
            obscureText: true,
            validator: passwordValidator,
            controller: passwordInputController,
            // validator: (value) => value.isEmpty
            //     ? 'Polje ne može biti prazno!'
            //     : null,
            // onSaved: (value) => newPassword = value,
          ),
        ),
      ),
    );
  }
}
