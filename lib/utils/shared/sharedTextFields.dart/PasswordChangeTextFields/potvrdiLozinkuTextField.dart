import 'package:Oglasnik/utils/shared/globalVariables.dart';
import 'package:Oglasnik/utils/shared/sharedvalidation/tokenandpassValidation/confirmPassValidator.dart';
import 'package:Oglasnik/view/PasswordChange/pages/passwordChange.dart';
import 'package:flutter/material.dart';

class PovrdiLozinku extends StatelessWidget {
  const PovrdiLozinku({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: EdgeInsets.only(bottom: 30),
      child: new SizedBox(
        width: double.infinity,
        child: Container(
          child: TextFormField(
            textInputAction: TextInputAction.done,
            onFieldSubmitted: (v) {
              FocusScope.of(context).unfocus();
            },
            style: TextStyle(
                // color: (nepoklapanje == true)
                //     ? Colors.red
                //     : Colors.black,
                color: doesMatch ? Colors.red : Colors.black),
            decoration: InputDecoration(
              hintText: 'Potvrdi lozinku',
              contentPadding: EdgeInsets.only(left: 10),
            ),
            obscureText: true,
            //controller: confirmPasswordInputController,
            initialValue: confirmPasswordChanged,
            onChanged: (value) => confirmPasswordChanged = value,
            validator: confirmpasswordValidator,
            // validator: (value) {
            //   if (value != passwordInputController.text) {
            //     return 'Lozinke se ne podudaraju!';
            //   }
            // }
          ),
        ),
      ),
    );
  }
}
