import 'package:Oglasnik/interface/authUserInterface.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:Oglasnik/model/userModel.dart';

class AuthService implements AuthCrud {
  final FirebaseAuth _auth = FirebaseAuth.instance;
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
              }).catchError((err) => print(err)))
          .catchError((err) => print(err));
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

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

  @override
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

  @override
  User userFromFirebaseUser(FirebaseUser user) {
    return user != null ? User(userID: user.uid) : null;
  }

  @override
  Stream<User> get user {
    return _auth.onAuthStateChanged.map(userFromFirebaseUser);
  }
}

// class AuthService {
//   final FirebaseAuth _auth = FirebaseAuth.instance;

//   // create user obj based on firebase user
//   User userFromFirebaseUser(FirebaseUser user) {
//     return user != null ? User(userID: user.uid) : null;
//   }

//   Stream<User> get user {
//     return _auth.onAuthStateChanged.map(userFromFirebaseUser);
//   }

//   // sign in anon
//   Future signInAnon() async {
//     try {
//       AuthResult result = await _auth.signInAnonymously();
//       FirebaseUser user = result.user;
//       return userFromFirebaseUser(user);
//     } catch (e) {
//       print(e.toString());
//       return null;
//     }
//   }

//   // sign in with email and password
//   Future signInWithEmailAndPassword(String email, String password) async {
//     try {
//       AuthResult result = await _auth.signInWithEmailAndPassword(
//           email: email, password: password);
//       FirebaseUser user = result.user;
//       return user;
//     } catch (error) {
//       print(error.toString());
//       return null;
//     }
//   }

//   // registeration with email and password
// Future registerWithEmailAndPassword(String email, String password,
//     String fullName, String phoneNumber) async {
//   try {
//     FirebaseAuth.instance
//         .createUserWithEmailAndPassword(email: email, password: password)
//         .then((currentUser) => Firestore.instance
//                 .collection("Users")
//                 .document(currentUser.user.uid)
//                 .setData({
//               "uid": currentUser.user.uid,
//               "fullname": fullName,
//               "phone": phoneNumber,
//               "email": email,
//             }).catchError((err) => print(err)))
//         .catchError((err) => print(err));
//   } catch (error) {
//     print(error.toString());
//     return null;
//   }
// }

//   // sign out
//   Future signOut() async {
// try {
//   return await _auth.signOut();
// } catch (error) {
//   print(error.toString());
//   return null;
// }
//   }
// }
