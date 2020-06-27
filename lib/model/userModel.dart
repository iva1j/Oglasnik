import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  String fullName, userID, phoneNumber, password;
  User({this.fullName, this.userID, this.phoneNumber, this.password});

  factory User.fromDocument(DocumentSnapshot doc) {
    return User(
        fullName: doc['fullName'],
        userID: doc['userID'],
        phoneNumber: doc['phoneNumber'],
        password: doc['password'],
        );
  }
}
