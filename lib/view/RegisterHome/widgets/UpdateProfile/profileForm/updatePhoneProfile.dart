import 'package:Oglasnik/utils/shared/sharedvalidation/registerValidation/phoneValidator.dart';
import 'package:Oglasnik/view/RegisterHome/pages/updateProfile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class UpdatePhone extends StatelessWidget {
  const UpdatePhone({
    Key key,
    this.user,
  }) : super(key: key);
  final DocumentSnapshot user;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: new SizedBox(
        width: double.infinity,
        child: Container(
          child: TextFormField(
            initialValue: user["phoneNumber"],
            validator: phoneValidator,
            autovalidate: false,
            inputFormatters: [
              new BlacklistingTextInputFormatter(
                RegExp(
                    '(\u00a9|\u00ae|[\u2000-\u3300]|\ud83c[\ud000-\udfff]|\ud83d[\ud000-\udfff]|\ud83e[\ud000-\udfff])'),
              ),
            ],
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(left: 20),
              hintText: 'Broj telefona',
            ),
            keyboardType: TextInputType.phone,
          ),
        ),
      ),
    );
  }
}
