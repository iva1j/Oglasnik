import 'package:Oglasnik/view/SignInPage/widgets/alertdialog.dart';
import 'package:mailgun/mailgun.dart';


var mailgun = MailgunMailer(
    domain: "sandbox44ed27b0ce334b3ea196fe6a51979c82.mailgun.org",
    apiKey: "5ca699a369f6818683e1bc9e599cc256-87c34c41-2e21d0f4",);


Future<void> sendemail() async {
  var response = await mailgun.send(
      from: 'tech387@reobreakti.gq',
      to: ['tech387@reobreakti.gq'],
      subject: "Zaboravili ste lozinku? ",
      text: "Token za resetovanje lozinke je: " );
  print(response.status);
  print(response.message);
  
}
