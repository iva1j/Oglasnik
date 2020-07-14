import 'package:Oglasnik/utils/strings.dart';
import 'package:Oglasnik/view/PasswordChange/pages/passwordChange.dart';

String nameValidator(String value) {
  Pattern pattern = r'(?!\s*$)';
  RegExp regex = new RegExp(pattern);
  if (value.length == null || value == '' || !regex.hasMatch(value))
    return 'Polje ne smije biti prazno';
  {
    return null;
  }
}

String productFieldsValidator(String value) {
  Pattern pattern = r'(?!\s*$)';  
  RegExp regex = new RegExp(pattern);
  if (value.length == null || value == '' || !regex.hasMatch(value))
    return 'Polje ne smije biti prazno';
  {
    return null;
  }
}

String phoneValidator(String value) {
  Pattern pattern = r'^[0-9]+$'; 
  RegExp regex = new RegExp(pattern);
  if (value.length == null || value == '') {
    return "Polje ne smije biti prazno";
  }
  if (!regex.hasMatch(value)) {
    return 'Molimo unesite validan broj telefona';
  }
  return null;
}

String emailValidator(String value) {
  Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@(gmail|hotmail|yahoo|aol|msn|live|outlook)+(\.com)$|@(hotmail|yahoo)+(\.fr|\.co.uk)$|@(orange)+(\.fr)$';
  RegExp regex = new RegExp(pattern);
  if (value.length == null || value == '') return 'Polje ne smije biti prazno';
  if (!regex.hasMatch(value)) {
    return 'Email mora biti validan';
  } else {
    return null;
  }
}

String emailRegisterCheck(String value) {
  Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@(gmail|hotmail|yahoo|aol|msn|live|outlook)+(\.com)$|@(hotmail|yahoo)+(\.fr|\.co.uk)$|@(orange)+(\.fr)$';
  RegExp regex = new RegExp(pattern);
  if (value.length == null || value == '') return 'Polje ne smije biti prazno';
  if (!regex.hasMatch(value)) {
    return 'Email mora biti validan';
  }
  if (!allowUserToRegister) {
    return 'Email se već koristi';
  } else {
    return null;
  }
}

String emailCheckSignIn(String value) {
  Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@(gmail|hotmail|yahoo|aol|msn|live|outlook)+(\.com)$|@(hotmail|yahoo)+(\.fr|\.co.uk)$|@(orange)+(\.fr)$';
  RegExp regex = new RegExp(pattern);
  if (value.length == null || value == '') return 'Polje ne smije biti prazno';
  if (!regex.hasMatch(value)) {
    return 'Email mora biti validan';
  }
  if (status == false) {
    return 'Email ili password nisu ispravni';
  } else {
    return null;
  }
}

String emailAlertDialogValidation(String value) {
  Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@(gmail|hotmail|yahoo|aol|msn|live|outlook)+(\.com)$|@(hotmail|yahoo)+(\.fr|\.co.uk)$|@(orange)+(\.fr)$';
  RegExp regex = new RegExp(pattern);
  if (value.length == null || value == '') return 'Polje ne smije biti prazno';
  if (!regex.hasMatch(value)) {
    return 'Email mora biti validan';
  }
  if (allowUserToChangePassword == false) {
    return 'Email ne postoji u bazi';
  } else {
    return null;
  }
}

String passwordCheckSignIn(String value) {
  if (value.length == null || value == '') return 'Polje ne smije biti prazno';
  if (value.length <= 7) {
    return 'Password ne smije biti manji od 8 char';
  }
  if (status == false) {
    return 'Email ili password nisu ispravni';
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

String confirmpasswordValidator(String value) {
  if (value.length == null || value == '') return 'Polje ne smije biti prazno';
  if (value != confirmPasswordInputController.text) {
    return 'Passwords do not match';
  }
  if (value.length <= 7) {
    print('Password ne smije biti manji od 8 char');
    return 'Password ne smije biti manji od 8 char';
  }
  if (nepoklapanje == true) {
    print('status poklapanja: ' + nepoklapanje.toString());
    return 'Šifra se ne podudara!';
  }
  return null;
}

String tokenValidator(String value) {
  if (value.length == null || value == '') return 'Polje ne smije biti prazno';
  if (tokenstatus == false) {
    return 'Kod nije validan';
  } else if (value.length != 5) {
    return 'Token mora biti dužine 5 karaktera';
  } else
    return null;
}

String productPriceValidator(String value) {
  Pattern pattern = r'^(\d{1,5}|\d{0,5}\.\d{1,2})$';
  RegExp regex = new RegExp(pattern);
  if (value.length == null || value == '') {
    return "Polje ne smije biti prazno";
  }
  else if (!regex.hasMatch(value) || value.length > 6) {
    return 'Cijena mora biti validna';
  }
  return null;
}

String productNameValidation(String value) {
  if (value.length == null || value == '') {
    return 'Polje ne smije biti prazno';
  }
  return null;
}

String productBrandValidation(String value) {
  if (value.length == null || value == '') {
    return 'Polje ne smije biti prazno';
  }
  return null;
}

String productTagValidation(String value) {
  if (value.length == null || value == '') {
    return 'Polje ne smije biti prazno';
  }
  return null;
}

String productDescValidation(String value) {
  if (value.length == null || value == '') {
    return 'Polje ne smije biti prazno';
  }
  return null;
}
