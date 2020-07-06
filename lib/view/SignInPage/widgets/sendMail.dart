 import 'package:Oglasnik/view/PasswordChange/pages/passwordChange.dart';
import 'package:Oglasnik/view/SignInPage/widgets/alertdialog.dart';

Future <void> sendemailf() async{
 var response = await mailgun.send(
  from: 'faruk.cidic@gmail.com',
  to: ['faruk.cidic@gmail.com'],
  subject: "Zaboravili ste lozinku? ",
  text: "Token za resetovanje lozinke je: " + tokenCode);
  print(response);
  }