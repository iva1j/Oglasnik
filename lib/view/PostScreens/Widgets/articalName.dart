import 'package:Oglasnik/utils/sizeconfig.dart';
import 'package:Oglasnik/utils/specialElements.dart';
import 'package:Oglasnik/utils/strings.dart';
import 'package:Oglasnik/utils/text_form_fields.dart';
import 'package:Oglasnik/view/PostScreens/Widgets/mainTitle.dart';

import 'package:flutter/material.dart';

class ArticalName extends StatelessWidget {
  const ArticalName({
    Key key,
    @required this.bottom,
  }) : super(key: key);

  final double bottom;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: bottom),
      child: Container(
        height: SizeConfig.screenHeight,
        margin: EdgeInsets.all(15),
        child: Column(
          children: <Widget>[
            Container(
                margin: EdgeInsets.only(bottom: 80.0), child: MainTitle()),
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Naziv artikla',
              ),
            ),
            Container(
                margin: EdgeInsets.only(top: 100.0),
                child: button('Dalje', () async {})),
          ],
        ),
      ),
    );
  }
}
