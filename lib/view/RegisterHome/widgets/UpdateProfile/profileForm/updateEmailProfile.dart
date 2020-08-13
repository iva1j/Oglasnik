import 'package:Oglasnik/utils/shared/globalVariables.dart';
import 'package:Oglasnik/utils/shared/sharedvalidation/registerValidation/emailRegisterCheckValidator.dart';
import 'package:Oglasnik/utils/sizeconfig.dart';
import 'package:Oglasnik/view/RegisterHome/pages/updateProfile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UpdateEmail extends StatelessWidget {
  const UpdateEmail({
    Key key,
    this.user,
  }) : super(key: key);
  final DocumentSnapshot user;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        bottom: SizeConfig.blockSizeVertical * 1,
      ),
      child: new SizedBox(
        width: double.infinity,
        child: Container(
          child: TextFormField(
            initialValue: user["email"],
            validator: emailRegisterCheck,
            autovalidate: false,
            onChanged: (value) {
              updateProfileEmail = value;
            },
            decoration: InputDecoration(
              hintText: 'Email',
              contentPadding: EdgeInsets.only(left: 20),
            ),
            keyboardType: TextInputType.visiblePassword,
          ),
        ),
      ),
    );
  }
}
