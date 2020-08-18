import 'package:Oglasnik/utils/shared/globalVariables.dart';
import 'package:Oglasnik/utils/shared/sharedvalidation/tokenandpassValidation/tokenValidator.dart';
import 'package:Oglasnik/view/PasswordChange/pages/passwordChange.dart';
import 'package:flutter/material.dart';

class UnesiKod extends StatelessWidget {
  const UnesiKod({
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
              hintText: 'Unesi kod',
              contentPadding: EdgeInsets.only(left: 10),
            ),
            //controller: tokenInputController,
            initialValue: passwordChangedToken,
            onChanged: (value) => passwordChangedToken = value,
            validator: tokenValidator,
          ),
        ),
      ),
    );
  }
}
