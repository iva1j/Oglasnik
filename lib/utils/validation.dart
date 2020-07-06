String nameValidator(String value) {
  Pattern pattern = r'(?!\s*$)';
  RegExp regex = new RegExp(pattern);
  if (value.length == null || value == '' || !regex.hasMatch(value))
    return 'Polje ne smije biti prazno';
  {
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
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@(gmail|hotmail|yahoo|aol|msn|live|outlook)+(\.com)$|@(hotmail|yahoo)+(\.fr|\.co.uk)$|@(orange)+(\.fr)$';
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

String confirmpasswordValidator(String value) {
  if (value.length == null || value == '') return 'Polje ne smije biti prazno';
  if (value.length <= 7) {
    return 'Password ne smije biti manji od 8 char';
  } else {
    return null;
  }
}
