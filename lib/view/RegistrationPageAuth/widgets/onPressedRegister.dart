import 'dart:async';
import 'package:Oglasnik/utils/shared/globalVariables.dart';
import 'package:Oglasnik/utils/strings.dart';
import 'package:Oglasnik/view/RegisterHome/pages/registeredHome.dart';
import 'package:Oglasnik/view/RegistrationPageAuth/pages/register.dart';
import 'package:Oglasnik/viewModel/FavoriteProduct/favoriteProductViewModel.dart';
import 'package:Oglasnik/viewModel/SignIn/SignInViewModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:Oglasnik/utils/shared/globalVariables.dart' as globals;
import 'package:Oglasnik/utils/globals.dart';
import 'package:Oglasnik/utils/shared/checkingInternetConnection/internetDialog.dart';
import 'package:Oglasnik/utils/shared/checkingInternetConnection/checkingInternet.dart';

class RegisterButton extends StatefulWidget {
  @override
  _RegisterButtonState createState() => _RegisterButtonState();
}

class _RegisterButtonState extends State<RegisterButton> {
  //bool isRegistered = false;
  final db = Firestore.instance;
  TextEditingController fullNameInputController;
  TextEditingController phoneNumberInputController;
  TextEditingController emailInputController;
  TextEditingController passwordInputController;

  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

void onPressedRegister(BuildContext context, String fullName, String email,
    String password, String phoneNumber) async {
  FocusScope.of(context).unfocus();
  FocusScope.of(context).requestFocus(new FocusNode()); //remove focus

  await InternetConnectivity().checkForConnectivity();
  // Timer(Duration(seconds: 1), () {
  //   print('trajanje sekunde:');
  //   InternetConnectivity().checkForConnectivity();
  // });
  // print('sekunda prošla:');
  if (hasActiveConnection) {
    Timer(Duration(seconds: 1), () {
      if (signUpRegisterFormKey.currentState.validate() &&
          allowUserToRegister) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          signUpPhoneNumberInputController.clear();
          signUpPasswordInputController.clear();
          signUpEmailInputController.clear();
          signUpFullNameInputController.clear();
        }); // clear content

        db.collection("firestoreUsers").document(email).setData({
          'fullName': fullName,
          'email': email,
          'password': password,
          'phoneNumber': phoneNumber,
        });
        print('korisnik uspješno ubačen u bazi');

        loginPrefs(context, email);
        globals.email = email;

        favoritesList.clear();
        FavoriteProduct().getAllFavoritesIDs().then((value) =>
            {for (final x in value) favoritesList.add(x['productID'])});

        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) {
            registeredGlob = true;
            return RegisteredHome();
          }),
        );
      } else {
        print('korisnik već u bazi, registracija nije uspjela');
      }
    });
  } else
    displayInternetDialog(context);
}
