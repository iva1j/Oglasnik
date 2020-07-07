import 'package:Oglasnik/view/SignInPage/widgets/alertdialog.dart';
import 'package:mailgun/mailgun.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

var mailgun = MailgunMailer(
  domain: DotEnv().env['MAILGUN_DOMAIN'],
  apiKey: DotEnv().env['MAILGUN_APIKEY'],
);

Future<void> sendemail() async {
  var response = await mailgun.send(
      from: 'fcidicwebmail@gmail.com',
      to: [emailAlertDialog],
      subject: "Zaboravili ste lozinku? ",
      text: "Token za resetovanje lozinke je: " + tokenCode);
  print(response.status);
  print(response.message);
}
