import 'package:Oglasnik/utils/strings.dart';

String emailAlertDialogValidation(String value) {
  if (allowUserToChangePassword == false) {
    return 'Email ne postoji u bazi';
  } else {
    return null;
  }
}
