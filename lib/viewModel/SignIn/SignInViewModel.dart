import 'dart:async';
import 'package:Oglasnik/utils/shared/globalVariables.dart';
import 'package:Oglasnik/utils/strings.dart';
import 'package:Oglasnik/view/PasswordChange/pages/passwordChange.dart';
import 'package:Oglasnik/view/RegisterHome/pages/registeredHome.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/successAlertDialog.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/successOnCreateAlertDialog.dart';
import 'package:Oglasnik/view/RegistrationPageAuth/pages/register.dart';
import 'package:Oglasnik/view/SignInPage/widgets/alertdialog.dart';
import 'package:Oglasnik/viewModel/Auth/authViewModel.dart';
import 'package:Oglasnik/viewModel/FavoriteProduct/favoriteProductViewModel.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:Oglasnik/utils/shared/globalVariables.dart' as globals;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:Oglasnik/utils/globals.dart';
import 'package:Oglasnik/utils/shared/checkingInternetConnection/internetDialog.dart';
import 'package:Oglasnik/utils/shared/checkingInternetConnection/checkingInternet.dart';

TextEditingController emailInputControllerAlertDialog;

///When user enter his email on AlertDialog, onPressed "odustani" is bellow:
void alerDialogOnPressedOdustani(BuildContext context) {
  Navigator.of(context).pop();
  emailInputController.clear();
}

///onPressed toggle that switch SignIn screen to SignUp
void toggleRegister(BuildContext context) {
  Navigator.pushReplacement(
    context,
    PageRouteBuilder(
      pageBuilder: (context, animation1, animation2) => RegisterPage(),
    ),
  );
  cleanLoginInputFields();
}

//clearing input fields with:
void cleanLoginInputFields() {
  emailInputController.clear();
  passwordInputController.clear();
}

///funkcija kojom provjeravamo da li cemo pustiti usera da se sign in
///prvobitno se provjerava status konekcije sa isOnline, ako jeste
///provjerava se da li su inputi ispravni i da li postoji u bazi preko varijable status
void onPressedSignInModel(
  BuildContext context,
  String email,
  String password,
) async {
  FocusScope.of(context).unfocus();
  FocusScope.of(context).requestFocus(new FocusNode()); //remove focus
  print('Internet konekcija dostupna: ' + hasInternetConnection.toString());
  await InternetConnectivity().checkForConnectivity();

  // Timer(Duration(seconds: 1), () {
  //   print('trajanje sekunde:');
  //   InternetConnectivity().checkForConnectivity();
  // });
  // print('sekunda prošla:');

  if (hasActiveConnection) {
    Timer(Duration(seconds: 1), () {
      if (signInRegisterFormKey.currentState.validate() && status == true) {
        print('Logged in');
        globals.email = email;
        favoritesList.clear();
        FavoriteProduct().getAllFavoritesIDs().then((value) =>
            {for (final x in value) favoritesList.add(x['productID'])});
        loginPrefs(context, email);
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) {
            registeredGlob = false;
            return RegisteredHome();
          }),
        );
      } else {
        print('Email ili password nisu tacni');
      }
    });
  } else
    displayInternetDialog(context);
}

///Metoda kojom preko SharedPrefernces zapamtimo koji se user log in
///da bi kasnije na splash screenu mogli provjeravati da li se user prethodno logovao
void loginPrefs(BuildContext context, String email) async {
  phoneNumberSetting(email);
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('email', email);
  //prefs.setString('phoneNumber', phoneNumber);
}

///Query kojim provjeravamo da li je željeni user unio broj telefona u bazu
///ako jeste, dodjeljujemo value iz baze u varijablu phoneNumber
void phoneNumberSetting(String email) async {
  final userQuery = await Firestore.instance
      .collection('firestoreUsers')
      .where('email', isEqualTo: email)
      .limit(1);
  //print(userQuery.getDocuments());
  userQuery.getDocuments().then((data) {
    if (data.documents.length > 0) {
      phoneNumber = data.documents[0].data['phoneNumber'];
    }
  });
}

///Future builder kojim provjeravamo da li je user unio email koji postoji u bazi
///u alert dialog za promjenu passworda, ako ukucani email postoji u bazi
///globalnu varijablu allowUserToChangePassword na true, na osnovu koje ćemo ga poslati na screen
///gdje ce ukucati token i novi password
///

List<DocumentSnapshot> testUser = List<DocumentSnapshot>();
allowPasswordChange(BuildContext context, String email) {
  FutureBuilder(
      future: AuthService().isEmailValid(email),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          testUser = snapshot.data.documents;
          //print('sejhul kurra: Omer Faruk Bukurević');
          //print(testUser[0]["email"]);

          // (email != testUser[0]["email"])
          //     ? allowUserToChangePassword = true
          //     : allowUserToChangePassword = false;
          allowUserToChangePassword = true;
          print('korisnik postoji');
          return Container();
        } else {
          print('korisnik nije u bazi');
          allowUserToChangePassword = false;
          return Container();
        }
      });
}

///Kada se user registruje, on se šalje na registered home, gdje mu iskače "čestitamo" alert dialog,
///da bi spriječili da se svaki put pokazuje taj dialog kada se user navigira na registeredHome,
///po iskakanju aler dialoga, postavljamo globalnu varijablu registeredGlob na false, da se više ne bi ponavljao
registeredShowDialog(BuildContext context) {
  if (registeredGlob) {
    registeredGlob = false;
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await showDialog<String>(
          context: context,
          builder: (BuildContext context) => successAlertDialog(context));
    });
  }
}

///Po kreiranju novog artikla, user se navigira na registered home, gdje dobija alert dialog koji ga
///obavjestava da je kreirao novi artikal, da bi sprijecili nepotrebno iskakanje alert dialoga kada se user
///navigira kroz aplikaciju, taj problem smo riješili koristenjem createdGlob globalne varijable koja prati da li je user
///zaista kreirao artikal ili je nekim drugim putem dosao do screena gdje iskace alert dialog.
createdShowDialog(BuildContext context) {
  if (createdGlob) {
    createdGlob = false;
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await showDialog<String>(
          context: context,
          builder: (BuildContext context) =>
              successOnCreateAlertDialog(context));
    });
  }
}

///When user enter his email on AlertDialog, button "pošalji" is configured bellow
void onPressedPosaljiKod(BuildContext context) async {
  Container(child: AuthService().allowPasswordChange(context, forgetEmail));
  AuthService().onPressedAlertDialog(context, forgetEmail, tokenCode);
}
