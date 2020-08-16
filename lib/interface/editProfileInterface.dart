import 'package:Oglasnik/model/productModel.dart';
import 'package:Oglasnik/model/userModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';


abstract class UpdateProfileInterface {
  Future<List<DocumentSnapshot>> getCurrentUserInfo(String email);
  Future<bool> isEmailReserved(String email);
}


