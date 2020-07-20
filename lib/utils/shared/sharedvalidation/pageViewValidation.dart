import 'package:Oglasnik/utils/shared/globalVariables.dart';

String productFieldsValidator(String value) {
  Pattern pattern = r'(?!\s*$)';
  RegExp regex = new RegExp(pattern);
  if (value.length == null || value == '' || !regex.hasMatch(value))
    return 'Polje ne smije biti prazno';
  {
    return null;
  }
}

String productPriceValidator(String value) {
  Pattern pattern = r'^(\d{1,6}|\d{0,5}\.\d{1,2})$';
  RegExp regex = new RegExp(pattern);
  if (value.length == null || value == '') {
    return "Polje ne smije biti prazno";
  } else if (!regex.hasMatch(value)) {
    return 'Neispravan unos';
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

String dropdownButtonValidation(String value) {
  if (value == 'Kategorija1') {
    return 'Molimo izaberite kategoriju';
  }
  return null;
}
