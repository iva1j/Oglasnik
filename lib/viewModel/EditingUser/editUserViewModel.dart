import 'package:Oglasnik/interface/editProfileInterface.dart';
import 'package:Oglasnik/utils/shared/globalVariables.dart';
import 'package:Oglasnik/utils/strings.dart';
import 'package:Oglasnik/utils/transitionFade.dart';
import 'package:Oglasnik/view/RegisterHome/pages/registeredHome.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EditProfile extends UpdateProfileInterface {
  @override
  Future<List<DocumentSnapshot>> getCurrentUserInfo(String email) async {
    var firestore = Firestore.instance;
    QuerySnapshot qn = await firestore
        .collection('firestoreUsers')
        .where('email', isEqualTo: email)
        .getDocuments();
    return qn.documents;
  }

  @override
  // ignore: missing_return
  Future<bool> isEmailReserved(String email) async {
    print("email sa kojim ste prijavljeni je: " + email.toString());
    print("email koji je spremljen u updateProfileEmail je: " +
        updateProfileEmail.toString());
    final QuerySnapshot result = await Firestore.instance
        .collection('firestoreUsers')
        //.where('email', isEqualTo: email)
        //.limit(1)
        .getDocuments();
    final List<DocumentSnapshot> emailDoc = result.documents;
    final List<String> userEmails = List<String>();
    emailDoc.forEach((element) {
      userEmails.add(element['email']);
    });
    print("lista emailova iz baze: ");
    print(userEmails);
    if (userEmails.contains(updateProfileEmail)) {
      if (updateProfileEmail == email) {
        allowUsertoUpdateEmail = true;
        currentEmail = true;
        print('email ostao nepromijenjen, ostali podaci uspješno editovani!');
      } else {
        allowUsertoUpdateEmail = false;
        currentEmail = false;
        print(
            'Bila je korekcija emaila, provjera u validaciji je nakon ovog ispisa!');
      }
    } else {
      print(
          "unešeni mail nije u bazi, stoga je uspješno prošla izmjena email-a.");
      allowUsertoUpdateEmail = true;
      currentEmail = false;
      // print("else: Trenutni status Alert Dialoga:" +
      //     allowUsertoUpdateEmail.toString());
    }
  }
}

void onPressedSaveButton(BuildContext context) async {
  await EditProfile().isEmailReserved(email);
  if (updateproductNameFormKey.currentState.validate()) {
    userChangedData(context);
  } else
    print('Nemoguce');
}

void userChangedData(BuildContext context) {
  db.collection("firestoreUsers").document(email).updateData({
    'fullName': updateProfileName,
    'email': updateProfileEmail,
    'phoneNumber': updateProfilePhoneNumber,
  });
  if (updateProfileEmail != email) {
    userChangedProfile();
  }

  currentEmail = null;
  allowUsertoUpdateEmail = null;
  Navigator.of(context).pushReplacement(FadeRoute(page: RegisteredHome()));
}

void userChangedProfile() {
  db.collection("firestoreUsers").document(updateProfileEmail).setData({
    'fullName': updateProfileName,
    'email': updateProfileEmail,
    'password': updateProfilePassword,
    'phoneNumber': updateProfilePhoneNumber,
  });
  db.collection("firestoreUsers").document(email).delete();
  email = updateProfileEmail;
}
