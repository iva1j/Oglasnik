import 'package:Oglasnik/utils/shared/globalVariables.dart';
import 'package:Oglasnik/utils/shared/sharedTextFields.dart/PageViewTextFields/oznakeTextField.dart';
import 'package:Oglasnik/utils/sizeconfig.dart';
import 'package:flutter/material.dart';

class TagsForm extends StatelessWidget {
  const TagsForm({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(bottom: SizeConfig.blockSizeVertical * 3),
        ),
        Container(
          margin: EdgeInsets.only(
            bottom: SizeConfig.blockSizeVertical * 17,
            left: SizeConfig.blockSizeHorizontal * 10,
            right: SizeConfig.blockSizeHorizontal * 10,
          ),
          child: Form(
              //autovalidate: true,
              key: productTagFormKey,
              child: Theme(
                data: ThemeData(
                  primaryColor: Colors.black54,
                  errorColor: Colors.red,
                ),
                child: OznakeTextField(),
              )),
        ),
      ],
    );
  }
}
