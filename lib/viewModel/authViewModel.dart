import 'package:Oglasnik/interface/authUserInterface.dart';
import 'package:Oglasnik/model/userModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final db = Firestore.instance;

class AuthService extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final db = Firestore.instance;

  User get user => null;

//updates the firestore users collection
  void _updateUserFirestore(User user, FirebaseUser firebaseUser) {
    db
        .document('/users/${firebaseUser.email}')
        .setData(user.toJson(), merge: true);
  }

// User registration using email and password         //currently, this function is in use for registering (and works fine)
  Future<bool> registerWithEmailAndPassword(
      String name, String email, String password) async {
    try {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((result) async {
        print('userID: ' + result.user.uid);
        print('email: ' + result.user.email);

        //create the new user object
        User _newUser = User(
            userID: result.user.uid,
            email: result.user.email,
            fullName: name,
            password: password);
        //update the user in firestore
        _updateUserFirestore(_newUser, result.user);
      });
      return true;
    } catch (e) {
      return false;
    }
  }

//trying to updateUser informations

  updateUserinFirestore(String name, String email, String password,) async {
    final databaseReference = Firestore.instance;
    await databaseReference
        .collection("users")
        .document(user.email)
        .updateData({
      'name': name,
      'email': email,
      'password': password,
    });
  }

  void updateUserData(String displayName, FirebaseUser firebaseUser,
      String email, String password) async {
    try {
      await _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((_firebaseUser) {
        _updateUserFirestore(user, _firebaseUser.user);

        db.document('/users/${firebaseUser.uid}').updateData(user.toJson());

        // await db.collection("users").document('/users/${firebaseUser.uid}').updateData({
        //   'name': displayName,
      });
    } catch (e) {}
  }

//handles updating the user when updating profile
  Future<bool> updateUser(User user, String oldEmail, String password) async {
    bool _result = false;
    await _auth
        .signInWithEmailAndPassword(email: oldEmail, password: password)
        .then((_firebaseUser) {
      _firebaseUser.user.updateEmail(user.email);
      _updateUserFirestore(user, _firebaseUser.user);
      _result = true;
    });
    return _result;
  }

//Method to handle user sign in using email and password
  Future<bool> signInWithEmailAndPassword(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      print('user successful signed in ');
      return true;
    } catch (e) {
      return false;
    }
  }

// class FormRegisterViewModel implements AuthRegisterWithEmailAndPassword {
//   @override
//   Future registerWithEmailAndPassword(String email, String password,
//       String fullName, String phoneNumber) async {
//     try {
//       _auth
//           .createUserWithEmailAndPassword(email: email, password: password)
//           .then((currentUser) =>
//               db.collection("Users").document(currentUser.user.uid).setData({
//                 "uid": currentUser.user.uid,
//                 "fullname": fullName,
//                 "phone": phoneNumber,
//                 "email": email,
//                 "password": password,
//               }).catchError((err) => print(err)))
//           .catchError((err) => print(err));
//     } catch (error) {
//       print(error.toString());
//       return null;
//     }
//   }
// }

// class RegisteredUserViewModel implements RegisteredUserInterface {
//   @override
//   Future getRegisterUser() async {
//     QuerySnapshot qn = await db.collection('Users').getDocuments(

//     );
//     return qn.documents;
//   }
// }

// class FormSignInViewModel implements AuthSignInWithEmailAndPassword {
//   @override
//   Future signInWithEmailAndPassword(String email, String password) async {
//     try {} catch (error) {
//       print(error.toString());
//       return null;
//     }

//   }
// }

  // @override
  // Stream<User> get user {
  //   return _auth.onAuthStateChanged.map(userFromFirebaseUser);
  // }

  Future<FirebaseUser> get getUser => _auth.currentUser(); //geting currentUser

// User _userFromFirebase(FirebaseUser user) {
//   return user != null ? User(userID: user.uid) : null;
// }

//Streams the firestore user from the firestore collection
  Stream<User> streamFirestoreUser(FirebaseUser firebaseUser) {
    if (firebaseUser?.uid != null) {
      return db
          .document('/users/${firebaseUser.uid}')
          .snapshots()
          .map((snapshot) => User.fromDocument(snapshot.data));
    }
    return null;
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
}

User userFromFirebaseUser(FirebaseUser user) {
  return user != null ? User(userID: user.uid) : null;
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

class AnonymousViewModel implements AnonymousInterface {
  @override
  Future getAnonymous() async {
    // dodjeljivanje uid-a Anonymous useru
    //final FirebaseAuth auth = FirebaseAuth.instance;
    try {
      //AuthResult result = await auth.signInAnonymously();
      //FirebaseUser user =  result.user;
      final FirebaseUser user = (await _auth.signInAnonymously()).user;
      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
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
