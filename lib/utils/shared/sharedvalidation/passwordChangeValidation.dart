import 'package:Oglasnik/view/PasswordChange/pages/passwordChange.dart';

import '../../strings.dart';

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
