
import 'package:Oglasnik/utils/specialElements.dart';
import 'package:Oglasnik/utils/validation.dart';
import 'package:Oglasnik/view/RegistrationPageAuth/widgets/onPressedRegister.dart';
import 'package:flutter/material.dart';

final GlobalKey<FormState> _registerFormKey = GlobalKey<FormState>();
TextEditingController fullNameInputController;
TextEditingController phoneNumberInputController;
TextEditingController emailInputController;
TextEditingController passwordInputController;

Form formRegister(String fullName, String email, String password,
    String phoneNumber, formKey, BuildContext context) {
  return Form(
    key: _registerFormKey,
    child: Column(children: <Widget>[
      new Container(
        margin: EdgeInsets.only(top: 10, bottom: 10),
        child: new SizedBox(
          width: double.infinity,
          child: Container(
            child: TextFormField(
              decoration: InputDecoration(
                hintText: 'Ime i prezime',
                contentPadding: EdgeInsets.only(left: 20),
              ),
              controller: fullNameInputController,
              keyboardType: TextInputType.text,
              validator: nameValidator,
            ),
          ),
        ),
      ),
      new Container(
        margin: EdgeInsets.only(bottom: 10),
        child: new SizedBox(
          width: double.infinity,
          child: Container(
            child: TextFormField(
              decoration: InputDecoration(
                hintText: 'Email',
                contentPadding: EdgeInsets.only(left: 20),
              ),
              controller: emailInputController,
              keyboardType: TextInputType.emailAddress,
              validator: emailValidator,
            ),
          ),
        ),
      ),
      new Container(
        margin: EdgeInsets.only(bottom: 10),
        child: new SizedBox(
          width: double.infinity,
          child: Container(
            child: TextFormField(
              decoration: InputDecoration(
                labelStyle: TextStyle(),
                hintText: 'Lozinka',
                contentPadding: EdgeInsets.only(left: 20),
              ),
              controller: passwordInputController,
              // keyboardType: TextInputType.visiblePassword,
              obscureText: true,
              validator: passwordValidator,
            ),
          ),
        ),
      ),
      new Container(
        margin: EdgeInsets.only(bottom: 30),
        child: new SizedBox(
          width: double.infinity,
          child: Container(
            child: TextFormField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(left: 20),
                hintText: 'Broj telefona',
              ),
              controller: phoneNumberInputController,
              keyboardType: TextInputType.phone,
              validator: phoneValidator,
            ),
          ),
        ),
      ),
      button(
        'Registruj se',
        () {
          fullName = fullNameInputController.text;
          email = emailInputController.text;
          password = passwordInputController.text;
          phoneNumber = phoneNumberInputController.text;
          formKey = _registerFormKey;
          onPressedRegister(
              context, fullName, email, password, phoneNumber, formKey);
        },
      ),
    ]),
  );
}

Container nameOfForm() {
  return Container(
    margin: EdgeInsets.only(top: 10),
    alignment: Alignment.centerLeft,
    child: Text(
      'Registracija',
      textDirection: TextDirection.ltr,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 23,
      ),
    ),
  );
}

