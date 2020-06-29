import 'package:Oglasnik/interface/authUserInterface.dart';
import 'package:Oglasnik/model/userModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class AnonymousViewModel implements AnonymousInterface {
  @override
  Future getAnonymous() async {
    // dodjeljivanje uid-a Anonymous useru
    //final FirebaseAuth auth = FirebaseAuth.instance;
    try {
      //AuthResult result = await auth.signInAnonymously();
      //FirebaseUser user =  result.user;
      final FirebaseUser user =
          (await FirebaseAuth.instance.signInAnonymously()).user;
      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}

class RegisteredUserViewModel implements RegisteredUserInterface {
  @override
  Future getRegisterUser() async {
    var auth = Firestore.instance;
    QuerySnapshot qn = await auth.collection('Users').getDocuments();
    return qn.documents;
  }
}

class SignOutModel implements AuthSignOut {
  @override
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (error) {
      print(error.toString());
      return null;
    }
  }
}

class FormRegisterViewModel implements AuthRegisterWithEmailAndPassword {
  @override
  Future registerWithEmailAndPassword(String email, String password,
      String fullName, String phoneNumber) async {
    try {
      FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((currentUser) => Firestore.instance
                  .collection("Users")
                  .document(currentUser.user.uid)
                  .setData({
                "uid": currentUser.user.uid,
                "fullname": fullName,
                "phone": phoneNumber,
                "email": email,
                "password": password,
              }).catchError((err) => print(err)))
          .catchError((err) => print(err));
    } catch (error) {
      print(error.toString());
      return null;
    }
  }
}

// User _userFromFirebase(FirebaseUser user) {
//   return user != null ? User(userID: user.uid) : null;
// }

class FormSignInViewModel implements AuthSignInWithEmailAndPassword {
  @override
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      return user;
    } catch (error) {
      print(error.toString());
      return null;
    }
  }
}

@override
Stream<User> get user {
  return _auth.onAuthStateChanged.map(userFromFirebaseUser);
}

class SignInAnonViewModel implements AuthSignInAnon {
  @override
  Future signInAnon() async {
    try {
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}

User userFromFirebaseUser(FirebaseUser user) {
  return user != null ? User(userID: user.uid) : null;
}

// sign out
Future signOut() async {
  try {
    return await _auth.signOut();
  } catch (error) {
    print(error.toString());
    return null;
  }
}
