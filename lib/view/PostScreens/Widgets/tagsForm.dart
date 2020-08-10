import 'package:Oglasnik/model/productModel.dart';
import 'package:Oglasnik/utils/shared/globalVariables.dart';
import 'package:Oglasnik/utils/shared/sharedTextFields.dart/PageViewTextFields/oznakeTextField.dart';
import 'package:Oglasnik/utils/sizeconfig.dart';
import 'package:flutter/material.dart';

class TagsForm extends StatelessWidget {
  const TagsForm({
    Key key,
    @required this.productSnapshot,
  }) : super(key: key);
  final Product productSnapshot;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(
            bottom: SizeConfig.blockSizeVertical * 14.5,
            left: SizeConfig.blockSizeHorizontal * 10,
            right: SizeConfig.blockSizeHorizontal * 10,
            top: SizeConfig.blockSizeVertical * 3,
          ),
          child: Form(
              //autovalidate: true,
              key: productTagFormKey,
              child: Theme(
                data: ThemeData(
                  primaryColor: Colors.black54,
                  errorColor: Colors.red,
                ),
                child: OznakeTextField(productSnapshot: productSnapshot),
              )),
        ),
      ],
    );
  }
}
