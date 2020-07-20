import '../../strings.dart';

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

String emailCheckSignIn(String value) {
  if (value.length == null || value == '') return 'Polje ne smije biti prazno';

  if (status == false) {
    return 'Email ili password nisu ispravni';
  } else {
    return null;
  }
}

String emailAlertDialogValidation(String value) {
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
