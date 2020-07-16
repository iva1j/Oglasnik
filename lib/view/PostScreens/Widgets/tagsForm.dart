import 'package:Oglasnik/utils/shared/globalVariables.dart';
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
          child: TextFormField(
            controller: productTagController,
            maxLines: null,
            keyboardType: TextInputType.multiline,
            textCapitalization: TextCapitalization.sentences,
            decoration: const InputDecoration(
                hintText: 'Oznake',
                helperText:
                    'Oznake razdvojiti zarezom: Sarajevo, zamjena, fulloprema...',
                contentPadding: EdgeInsets.only(left: 10.0)),
          ),
        ),
      ],
    );
  }
}
