import 'package:Oglasnik/utils/shared/globalVariables.dart';
import 'package:flutter/material.dart';

class TagsForm extends StatelessWidget {
  const TagsForm({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(bottom: 40.0),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 35.0),
          child: TextFormField(
            controller: productTagController,
            maxLines: null,
            keyboardType: TextInputType.multiline,
            decoration: const InputDecoration(
                hintText: 'Oznake',
                helperText:
                    'Oznake razdvojiti zarezom: Sarajevo, zamjena, Yoda',
                contentPadding: EdgeInsets.only(left: 15.0)),
          ),
        ),
      ],
    );
  }
}
