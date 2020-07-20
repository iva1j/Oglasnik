import 'package:Oglasnik/utils/shared/globalVariables.dart';
import 'package:Oglasnik/view/RegistrationPageAuth/pages/register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:Oglasnik/utils/sizeconfig.dart';
import 'package:Oglasnik/view/AnonymousHome/pages/anonymousHome.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () async {
        print(phoneNumber);
        await FirebaseAuth.instance.signOut();
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.remove('email');
        //prefs.remove('phoneNumber');
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (BuildContext ctx) => AnonymousHome()));
      },
      icon: Icon(
        Icons.power_settings_new,
        color: Colors.white,
        size: SizeConfig.blockSizeHorizontal * 10,
      ),
    );
  }
}
