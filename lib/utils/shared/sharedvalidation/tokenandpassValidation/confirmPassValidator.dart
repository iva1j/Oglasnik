import 'package:Oglasnik/utils/strings.dart';
import 'package:Oglasnik/view/PasswordChange/pages/passwordChange.dart';

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
