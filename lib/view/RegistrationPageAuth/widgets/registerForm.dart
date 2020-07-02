import 'package:Oglasnik/utils/specialElements.dart';

import 'package:Oglasnik/utils/strings.dart';
import 'package:Oglasnik/view/RegistrationPageAuth/widgets/onPressedRegister.dart';
import 'package:Oglasnik/viewModel/authViewModel.dart';

import 'package:Oglasnik/view/RegistrationPageAuth/widgets/onPressedRegister.dart';

import 'package:flutter/material.dart';

final GlobalKey<FormState> _registerFormKey = GlobalKey<FormState>();
TextEditingController fullNameInputController;
TextEditingController phoneNumberInputController;
TextEditingController emailInputController;
TextEditingController passwordInputController;

String nameValidator(String value) {
  if (value.length == null || value == '')
    return 'Polje ne smije biti prazno';
  else {
    return null;
  }
}

String phoneValidator(String value) {
  if (value.length == 0) {
    return 'Polje ne smije biti prazno';
  }
  return null;
}

String emailValidator(String value) {
  Pattern pattern =
      r'^((\s?[^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}\s?\s?))$';
  RegExp regex = new RegExp(pattern);
  if (value.length == null || value == '') return 'Polje ne smije biti prazno';
  if (!regex.hasMatch(value)) {
    return 'Email mora biti validan';
  } else {
    return null;
  }
}

String passwordValidator(String value) {
  if (value.length == null || value == '') return 'Polje ne smije biti prazno';
  if (value.length <= 7) {
    return 'Password ne smije biti manji od 8 char';
  } else {
    return null;
  }
}

Form formRegister(String fullName, String email, String password,
    String phoneNumber, formKey, BuildContext context, bool isRegistered) {
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
        App_Labels_Auth().registracija,
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
