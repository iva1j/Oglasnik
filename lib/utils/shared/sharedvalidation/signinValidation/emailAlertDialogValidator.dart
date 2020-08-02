import 'package:Oglasnik/utils/strings.dart';

String emailAlertDialogValidation(String value) {
    if (value.length == null || value == '') return 'Polje ne smije biti prazno';

  if (status == false) {
    return 'Email ne postoji u bazi';
  } else {
    return null;
  }
  // if (allowUserToChangePassword == false) {
  //   return 'Email ne postoji u bazi';
  // } else {
  //   return null;
  // }
}
