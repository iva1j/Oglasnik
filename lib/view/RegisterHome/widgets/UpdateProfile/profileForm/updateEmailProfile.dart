import 'package:Oglasnik/utils/sizeconfig.dart';
import 'package:Oglasnik/view/RegisterHome/pages/updateProfile.dart';
import 'package:flutter/material.dart';

class UpdateEmail extends StatelessWidget {
  const UpdateEmail({
    Key key,
  }) : super(key: key);

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
            decoration: InputDecoration(
              hintText: 'Email',
              contentPadding: EdgeInsets.only(left: 20),
            ),
            controller: updateEmailInputController,
            keyboardType: TextInputType.visiblePassword,
          ),
        ),
      ),
    );
  }
}
