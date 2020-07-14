import 'package:Oglasnik/utils/shared/globalVariables.dart';
import 'package:Oglasnik/utils/validation.dart';
import 'package:flutter/material.dart';
import 'package:Oglasnik/utils/sizeconfig.dart';

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
          margin: EdgeInsets.only(bottom: 40.0),
        ),
        Container(
          margin: EdgeInsets.only(
            bottom: SizeConfig.blockSizeVertical * 13,
            left: SizeConfig.blockSizeHorizontal * 10,
            right: SizeConfig.blockSizeHorizontal * 10,
          ),
          child: Form(
            key: productTagFormKey,
            child: TextFormField(
              controller: productTagController,
              validator: productFieldsValidator,
              maxLines: null,
              keyboardType: TextInputType.multiline,
              decoration: const InputDecoration(
                hintText: 'Oznake',
                helperText:
                    'Oznake razdvojiti zarezom: Sarajevo, zamjena, Yoda',
                contentPadding: EdgeInsets.only(left: 15.0),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
