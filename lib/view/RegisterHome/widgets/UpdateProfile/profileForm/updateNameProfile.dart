import 'package:Oglasnik/utils/shared/globalVariables.dart';
import 'package:Oglasnik/utils/shared/sharedTextFields.dart/RegisterTextFields/nameTextField.dart';
import 'package:Oglasnik/utils/shared/sharedvalidation/registerValidation/nameValidator.dart';
import 'package:Oglasnik/utils/sizeconfig.dart';
import 'package:Oglasnik/view/RegisterHome/pages/updateProfile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class UpdateName extends StatefulWidget {
  const UpdateName({
    Key key,
    this.user,
  }) : super(key: key);
  final DocumentSnapshot user;

  @override
  _UpdateNameState createState() => _UpdateNameState();
}

class _UpdateNameState extends State<UpdateName> {
  @override
  Widget build(BuildContext context) {
    updateProfilePassword = widget.user["password"];

    return Container(
      margin: EdgeInsets.only(
        top: SizeConfig.blockSizeVertical * 15,
        bottom: SizeConfig.blockSizeVertical * 1,
      ),
      child: new SizedBox(
        width: double.infinity,
        child: Container(
          child: TextFormField(
            autovalidate: false,
            initialValue: updateProfileName == null
                ? updateProfileName = widget.user["fullName"]
                : updateProfileName,
            validator: nameValidator,
            onChanged: (value) {
              updateProfilePassword = widget.user["password"];
              updateProfileName = value;
            },
            autofocus: false,
            inputFormatters: [
              new BlacklistingTextInputFormatter(
                RegExp(
                    '(\u00a9|\u00ae|[\u2000-\u3300]|\ud83c[\ud000-\udfff]|\ud83d[\ud000-\udfff]|\ud83e[\ud000-\udfff])'),
              ),
            ],
            textCapitalization: TextCapitalization.words,
            decoration: InputDecoration(
              hintText: 'Ime i prezime',
              contentPadding: EdgeInsets.only(left: 20),
            ),
            // controller: updateFullNameInputController,
            keyboardType: TextInputType.text,
          ),
        ),
      ),
    );
  }
}
