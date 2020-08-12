import 'package:Oglasnik/utils/sizeconfig.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/UpdateProfile/profileForm/updateEmailProfile.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/UpdateProfile/profileForm/updateNameProfile.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/UpdateProfile/profileForm/updatePhoneProfile.dart';
import 'package:flutter/material.dart';

class ProfileForm extends StatelessWidget {
  const ProfileForm({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: SizeConfig.blockSizeHorizontal * 13,
        right: SizeConfig.blockSizeHorizontal * 13,
      ),
      child: Form(
        child: Theme(
          data: ThemeData(
            primaryColor: Colors.black54,
            errorColor: Colors.red,
          ),
          child: Column(
            children: <Widget>[
              UpdateName(),
              UpdateEmail(),
              UpdatePhone(),
            ],
          ),
        ),
      ),
    );
  }
}
