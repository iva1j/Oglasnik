import 'package:Oglasnik/utils/shared/globalVariables.dart';
import 'package:Oglasnik/utils/shared/sharedbuttons/mainAppButtons/redButton.dart';
import 'package:Oglasnik/utils/sizeconfig.dart';
import 'package:Oglasnik/viewModel/EditingUser/editUserViewModel.dart';
import 'package:flutter/material.dart';

class ProfileSaveButton extends StatelessWidget {
  const ProfileSaveButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.only(
            top: SizeConfig.blockSizeVertical * 8,
            bottom: SizeConfig.blockSizeVertical * 1),
        child: button(
          'Sačuvaj',
          () async {
            await EditProfile().isEmailReserved(email);

            onPressedSaveButton(context);
          },
        ),
      ),
    );
  }
}
