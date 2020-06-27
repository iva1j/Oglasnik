import 'package:Oglasnik/model/userModel.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AnonymousInterface {
  Future getAnonymous();
}

abstract class RegisteredUserInterface {
  Future getRegisterUser();
}

abstract class SignInUserInterface {
  Future signInUser();
}

abstract class AuthCrud {
  User userFromFirebaseUser(FirebaseUser user);
  Future signInAnon();
  Future signInWithEmailAndPassword(String email, String password);
  Future registerWithEmailAndPassword(
      String email, String password, String fullName, String phoneNumber);
  Future signOut();
  Stream<User> get user;
}
