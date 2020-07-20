import 'package:flutter/cupertino.dart';

//klase poredane po folderima iz view-a

class NewPostScreen {
  String unosNaslov = "Novi unos";
}

class MoneyText {
  String kmText = "KM";
}

class AppLabelsAuth {
  String signInButton = 'testing';
  String registracija = 'Registruj se';
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

class SuccessAlertDialog {
  String odlicno = "Odlično!";
  String cestitamo = "Čestitamo!";
  String opis1 =
      "Uspješno ste se registrovali na našu platformu Oglasnik.Sada možete napraviti svoj prvi artikal i ponuditi ga našim korisnicima.";
  String opis2 = "Želimo Vam uspješno trgovanje.";
  String opis3 =
      "Uspješno ste kreirali novi artikal na našoj platformi Oglasnik.";

  String uredu = "UREDU";
  String kreiraj = "KREIRAJ";
}

//..view/SplashScreen
class SplashScreen {
  String splashText = "OGLASNIK";
  String fontFamily = "Roboto";
}

class ProductDetailsStrings {
  String cityLocation = 'Sarajevo';
  String productPriceText = '72.000 KM';
  String categoryName = 'Automobili';
  String productName = 'Audi A6';
  String productTestDesc =
      'Prodajem Audi A6 2012 godište, u izvrsnom stanju sa ljetnim gumama. Registrovan do maja 2020. Sve informacije na broj 061367223. Moguca je zamjena za ovaj artikal.';
  String callText = 'NAZOVI';
  String callInfoText = 'Kontakt telefon';
  String callNumberText = '060 335 221 3';
}

class ImageOneUpload {}

class ImageTwoUpload {}

class ImageThreeUpload {}

String next = 'Dalje';
String lastPage = 'Završi';
bool alertstatus = false;
bool status = false;
bool tokenstatus = false;
var nepoklapanje = false;
bool allowUserToChangePassword = false;
bool allowUserToRegister = true;
//final GlobalKey<FormState> _registerFormKey = GlobalKey<FormState>();
//final GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();
GlobalKey<FormState> passwordChangeFormKey = GlobalKey<FormState>();
GlobalKey<FormState> alertFormKey = GlobalKey<FormState>();

//#TODO create file named "globalVariables" and there store global Variables such as GlobalKey etc
String img1 = "Dodaj sliku 1";
String img2 = "Dodaj sliku 2";
String img3 = "Dodaj sliku 3";

final String immutableImg1 = "Dodaj sliku 1";
final String immutableImg2 = "Dodaj sliku 2";
final String immutableImg3 = "Dodaj sliku 3";

final String noPhoto = "assets/images/nophoto.jpg";
