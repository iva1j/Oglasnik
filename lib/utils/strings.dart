import 'package:flutter/cupertino.dart';

//klase poredane po folderima iz view-a

class App_Labels_Auth {
  String signInButton = 'testing';
  String registracija = 'registracija amer';
}

//..view//AnonymusHome
class AnonymusHomePages {
  String appBarAnon = "Oglasnik";
}

class AnonymusHomeWidgets {
  String podDugmePrijava = "Prijava";
  String podDugmeRegistracija = "Registracija";
}

//..view//PasswordChange
class PasswordChangePage {
  String columnFirstChild = "Promijeni šifru";
  String firstChildFontFamily = "Roboto";
  String textFieldHint = "Unesi kod";
  String secondTextFieldHint = "email";
  String thirdTextFieldHint = "Potvrdi šifru";
  String buttonString = "Sačuvaj";
  String collectionName = "firestoreUsers";
  String updatedDataString = "password";
}

//..view/RegisterHome
class RegistereHomePages {
  String naslov = "Oglasnik";
}

class RegisterHomeWidgets {
  String dodavanjeOglasa = "Novi oglas";
}

//..view/RegistrationPageAuth
class RegistrationPageAuthPages {
  String prijava = "Prijavi se";
  String prviHint = "Ime i prezime";
  String drugiHint = "Email";
  String treciHint = "Lozinka";
  String cetvrtiHint = "Broj telefona";
  String registrovanje = "Registracija";
}

class RegistrationPageAuthFirstWidget {
  String databaseCollection = "firestoreUsers";
  // print statements and keys arent refactored
}

class RegistrationPageAuthSecondWidget {
  String firstHint = "Ime i prezime";
  String secondHint = "Email";
  String thirdHint = "Lozinka";
  String fourthHint = "Broj telefona";
  String buttonText = "Registruj se";
  String nameOfFormText = "Registracija";
}

class RegistrationPageAuthThirdWidget {
  String dobrodoslica = "Dobrodošli u Oglasnik";
}

//..view/SignInPage
class SignInPagePages {
  //print statementi nisu refaktorisani
  String registracijaField = "Registruj se";
}

class SignInPageWidgetOne {
  String emailHint = "Email";
  String odustaniDugme = "ODUSTANI";
  String fontFamilyDugmadi = "Roboto";
  String dugmeZaSlanje = "POŠALJI KOD";
}

class SignInPageWidgetTwo {
  String emailHint = "Email";
  String passHint = "Lozinka";
  String dugmePrijave = "Prijavi se";
  String forgottenPass = "Zaboravili ste lozinku?";
  String fontZaText = "Roboto";
}

class SignInPageWidgetThree {
  //nema stringova za sada
}

class SignInPageWidgetFout {
  String prijavaTekst = "Prijava";
}

//..view/SplashScreen
class SplashScreen {
  String splashText = "OGLASNIK";
  String fontFamily = "Roboto";
}

bool status = false;
final GlobalKey<FormState> _registerFormKey = GlobalKey<FormState>();
final GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();
GlobalKey<FormState> globalKey() => registerFormKey;

class InputFields {
  TextEditingController emailInputController = new TextEditingController();
  TextEditingController passwordInputController = new TextEditingController();
}
//#TODO create file named "globalVariables" and there store global Variables such as GlobalKey etc