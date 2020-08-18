import 'package:cloud_firestore/cloud_firestore.dart';

abstract class UpdateProfileInterface {
  Future<List<DocumentSnapshot>> getCurrentUserInfo(String email);
  Future<bool> isEmailReserved(String email);
}
