import 'package:Oglasnik/interface/authUserInterface.dart';
import 'package:Oglasnik/utils/globals.dart';
import 'package:Oglasnik/utils/shared/globalVariables.dart';
import 'package:Oglasnik/utils/shared/sharedbuttons/mainAppButtons/redButton.dart';
import 'package:Oglasnik/utils/sizeconfig.dart';
import 'package:Oglasnik/utils/strings.dart';
import 'package:Oglasnik/utils/transitionFade.dart';
import 'package:Oglasnik/view/AnonymousHome/pages/anonymousHome.dart';
import 'package:Oglasnik/view/RegisterHome/pages/registeredHome.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileSaveButton extends StatelessWidget {
  const ProfileSaveButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.only(
            top: SizeConfig.blockSizeVertical * 8,
            bottom: SizeConfig.blockSizeVertical * 1),
        child: button(
          'Sačuvaj',
          () async {
            print('prvi' + isOnline.toString());
            // updateProfileEmail.isEmpty || updateProfileEmail == null
            //     ? updateProfileEmail = email
            //     : updateProfileEmail;

            if (updateproductNameFormKey.currentState.validate()

                // && allowUserToRegister == true
                ) {
              db.collection("firestoreUsers").document(email).updateData({
                'fullName': updateProfileName,
                'email': updateProfileEmail,
                'phoneNumber': updateProfilePhoneNumber,
              });
              if (updateProfileEmail != email) {
                db.collection("firestoreUsers").document(email).delete();
                db
                    .collection("firestoreUsers")
                    .document(updateProfileEmail)
                    .setData({
                  'fullName': updateProfileName,
                  'email': updateProfileEmail,
                  'password': updateProfilePassword,
                  'phoneNumber': updateProfilePhoneNumber,
                });
              }
              email = null;
              await FirebaseAuth.instance.signOut();
              SharedPreferences prefs = await SharedPreferences.getInstance();
              prefs.remove('email');
              prefs.remove('phoneNumber');
              print("email: " +
                  email.toString() +
                  " phoneNumber: " +
                  phoneNumber.toString());
              Navigator.of(context).pushAndRemoveUntil(
                  FadeRoute(page: AnonymousHome()),
                  (Route<dynamic> route) => false);
              print('drugi' + isOnline.toString());
              // Navigator.of(context).pushReplacement(
              //   MaterialPageRoute(builder: (_) {
              //     return RegisteredHome();
              //   }),
              // );
            }
            // else
            //   print('Nemoguce');
          },
        ),
      ),
    );
  }
}
